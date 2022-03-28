
. .\config.ps1

$ES_ENDPOINT = $(aws opensearch describe-domain --domain-name $ES_DOMAIN_NAME --output text --query "DomainStatus.Endpoint")

echo "URL de acceso a OpenSearch: https://${ES_ENDPOINT}/_dashboards/
Usuario de OpenSearch: ${ES_DOMAIN_USER}
Pwd de OpenSearch: ${ES_DOMAIN_PASSWORD}"
