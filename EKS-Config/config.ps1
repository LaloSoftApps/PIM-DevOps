
# Definir el nombre del Cluster EKS
$CLUSTER_NAME = ""

# Definir la región por defecto en una variable de ambiente
$AWS_REGION = "us-east-2"

#Definir el id de la cuenta en una variable de ambiente
#$ACCOUNT_ID = $(aws sts get-caller-identity | ConvertFrom-Json).UserId
$ACCOUNT_ID = ""

#Definir el nombre de dominio para el cluster de Elasticsearch
$ES_DOMAIN_NAME = "eksworkshop-logging"

# Definir la version de OpenSearch
$ES_VERSION = "OpenSearch_1.0"

# Definir OpenSearch admin user
$ES_DOMAIN_USER = "eksworkshop"

# Definir OpenSearch admin password
$ES_DOMAIN_PASSWORD = "PPkkrr44OOff_kkee$"

$GRAFANA_PASSWORD = "OOyyMMWW88_99$"