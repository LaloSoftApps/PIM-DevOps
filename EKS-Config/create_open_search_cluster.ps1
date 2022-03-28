. .\config.ps1

# Editamos la plantilla de OpenSearch
 
$ContentJson = Get-Content .\es_domain_base.json

$ContentJson = $ContentJson.replace("#{ACCOUNT_ID}#","$ACCOUNT_ID")
$ContentJson = $ContentJson.replace("#{ES_DOMAIN_NAME}#","$ES_DOMAIN_NAME")
$ContentJson = $ContentJson.replace("#{AWS_REGION}#","$AWS_REGION")
$ContentJson = $ContentJson.replace("#{ES_VERSION}#","$ES_VERSION")
$ContentJson = $ContentJson.replace("#{ES_DOMAIN_USER}#","$ES_DOMAIN_USER")
$ContentJson = $ContentJson.replace("#{ES_DOMAIN_PASSWORD}#","$ES_DOMAIN_PASSWORD")
$ContentJson = $ContentJson.replace("#{CLUSTER_NAME}#","$CLUSTER_NAME")

$ContentJson | Out-File .\es_domain.json -Encoding ASCII

# Creamos el Cluster de OpenSearch
aws opensearch create-domain --cli-input-json file://es_domain.json

pause 

echo "Validamos la Correcta Creacion del Cluster..."

if (aws opensearch describe-domain --domain-name $ES_DOMAIN_NAME --query 'DomainStatus.Processing') {
    echo "The Elasticsearch cluster is ready"
} else {
    echo "The Elasticsearch cluster is NOT ready"
}




