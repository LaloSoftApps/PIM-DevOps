# Creamos el ServAccount
Kubectl apply -f ado-admin-service-account.yaml

# Obtenemos el secret asociado
$TokenName = ($(kubectl get serviceAccounts ado -n kube-system -o yaml | Select-String -Pattern "- name") -split ": ")[1]
kubectl get secret $TokenName -n kube-system -o json

# Obtenemos la API URL del Cluster EKS
kubectl cluster-info | Select-String -Pattern "Kubernetes master|Kubernetes control plane" | Where-Object{$_ -match "http"} 

# "Crear el KubernetesServiceConection eks-mundos-e-2 con los anteriores datos"