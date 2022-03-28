
. .\config.ps1

$ContentJson = Get-Content .\fluent-bit-policy_base.json

$ContentJson = $ContentJson.replace("#{ACCOUNT_ID}#","$ACCOUNT_ID")
$ContentJson = $ContentJson.replace("#{ES_DOMAIN_NAME}#","$ES_DOMAIN_NAME")
$ContentJson = $ContentJson.replace("#{AWS_REGION}#","$AWS_REGION")

$ContentJson | Out-File .\fluent-bit-policy.json -Encoding ASCII

aws iam create-policy --policy-name fluent-bit-policy --policy-document file://fluent-bit-policy.json
