
resource "aws_security_group" "pc_linux" {
  name        = "sg_pc_linux"
  vpc_id      = "vpc-e88e1183"
  count       = 1

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "WEB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "mundose_server" {
  # ami ubuntu 20
  ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.pc_linux[0].id ]
  key_name   = "jenkins"
  count = 1

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 8
  }

  tags = {
    Name = "Jenkins"
  }
  
  user_data = file("${path.cwd}/ec2_user_data.sh")
}