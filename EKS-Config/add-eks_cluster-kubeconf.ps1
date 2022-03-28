. .\config.ps1

aws eks --region $AWS_REGION update-kubeconfig --name $CLUSTER_NAME
