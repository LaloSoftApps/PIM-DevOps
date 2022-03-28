. .\config.ps1

# Agregamos el repo de prometheus y grafana a Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

# Desplegar Prometheus
kubectl create namespace prometheus
helm install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"

# Desplegamos Grafana y le creamos el datasource de prometheus
kubectl create namespace grafana

helm install grafana grafana/grafana --namespace grafana --set persistence.storageClassName="gp2" --set persistence.enabled=true --set adminPassword="$GRAFANA_PASSWORD" --values grafana.yaml --set service.type=LoadBalancer

# Obtenemos la URL de Grafana
echo "URL de Grafana:"
kubectl get svc -n grafana grafana -o json | Select-String "hostname"
echo "Pwd: $GRAFANA_PASSWORD"
