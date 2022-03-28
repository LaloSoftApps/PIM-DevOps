. .\config.ps1

$ES_ENDPOINT = $(aws opensearch describe-domain --domain-name $ES_DOMAIN_NAME --output text --query "DomainStatus.Endpoint")

$ContentJson = Get-Content .\fluentbit_base.yaml

$ContentJson = $ContentJson.replace("#{ES_ENDPOINT}#","$ES_ENDPOINT")
$ContentJson = $ContentJson.replace("#{AWS_REGION}#","$AWS_REGION")

echo "ES_ENDPOINT: $ES_ENDPOINT"
echo "AWS_REGION: $AWS_REGION"

$ContentJson | Out-File .\fluentbit.yaml

kubectl apply -f fluentbit.yaml
kubectl -n logging get pods
