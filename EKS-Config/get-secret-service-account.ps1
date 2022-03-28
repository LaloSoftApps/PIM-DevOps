# Obtenemos el TokenName 
$TokenName = ($(kubectl get serviceAccounts ado -n kube-system -o yaml | Select-String -Pattern "- name") -split ": ")[1]

echo "----- Get Secret -----" 
kubectl get secret $TokenName -n kube-system -o json

echo "----- Get API url -----" 
kubectl cluster-info | Select-String  -Pattern "Kubernetes master|Kubernetes control plane" | Where-Object{$_ -match "http"} 
