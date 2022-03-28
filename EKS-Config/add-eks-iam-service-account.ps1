. .\config.ps1

kubectl create namespace logging

eksctl create iamserviceaccount --name fluent-bit --namespace logging --cluster $CLUSTER_NAME --attach-policy-arn "arn:aws:iam::$ACCOUNT_ID:policy/fluent-bit-policy" --approve --override-existing-serviceaccounts

