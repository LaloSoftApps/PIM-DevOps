. .\config.ps1


# Obtenemos el Role ARN de  Fluent Bit 
$FLUENTBIT_ROLE = $(eksctl get iamserviceaccount --cluster $CLUSTER_NAME --namespace logging -o json | jq '.[].status.roleARN' -r)

# Obtenemos el EndPoint de  OpenSearch
$ES_ENDPOINT = $(aws opensearch describe-domain --domain-name $ES_DOMAIN_NAME --output text --query "DomainStatus.Endpoint")

echo "FLUENTBIT_ROLE: $FLUENTBIT_ROLE"
echo "ES_ENDPOINT: $ES_ENDPOINT"
echo "ok?"
pause

# Asignamos el Rol por la interfaz
curl -sS -u "$ES_DOMAIN_USER:$ES_DOMAIN_PASSWORD" \
    -X PATCH \
    https://$ES_ENDPOINT/_opendistro/_security/api/rolesmapping/all_access?pretty \
    -H 'Content-Type: application/json' \
    -d'
[
{
    "op": "add", "path": "/backend_roles", "value": ["'$FLUENTBIT_ROLE'"]
}
]
'
