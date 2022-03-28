param (
    [string]$NodeIp=""
)

#$TfOutput = terraform output
#$IP = $TfOutput.split("=")[1]
#$IP = $IP.Substring(2,$IP.Length-3)

#icacls.exe ~/.ssh/jenkins.pem /reset
#icacls.exe ~/.ssh/jenkins.pem /grant:r $env:USERNAME:(R)
#icacls.exe ~/.ssh/jenkins.pem /inheritance:r

# ssh -i ./jenkins.pem ubuntu@3.145.121.92
# ssh -i ~/.ssh/jenkins.pem ubuntu@$IP

ssh -i ~/.ssh/jenkins.pem ubuntu@$NodeIp
