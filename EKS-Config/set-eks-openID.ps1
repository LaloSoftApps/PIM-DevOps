. .\config.ps1

# Configuramos el IAM Open ID Connect
eksctl utils associate-iam-oidc-provider --cluster $CLUSTER_NAME --approve
