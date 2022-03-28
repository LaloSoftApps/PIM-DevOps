- Lanzamos Pipeline para crear el S3 del backend de Terraform

- Lanzamos el Pipeline de despliegue del EC2 (a modo demostracion, ya que lanzamos todos los desplieges desde los pipelines)

- Lanzamos el Pipeline de despliegue del cluster de EKS

- Desde mi pc:
    - Pulleamos el repo de scripts de EKS-Config
        git clone https://lalosoftapps@dev.azure.com/lalosoftapps/MundosE/_git/EKS-Config
	
	- Editamos el fichero de configuracion con el nombre del Cluster EKS
		notepad config.ps1
		
	Configurar el kubeconfig
		.\add-eks_cluster-kubeconf.ps1

	- Agregamos mi usuario al configmap de autorizaciones
		kubectl edit -n kube-system configmap/aws-auth
				
	Desplegamos el ServiceAccount
		.\add-eks-cluster-service-account.ps1
	
	Obtenemos el secret y la API URL
		.\get-secret-service-account.ps1

- Desde AzDo, Creamos el Service Connection de Kubernetes "eks-mundos-e-2" con los datos (url y json) del Service Account antes obtenidos.

- Lanzamos el Pipeline de despliegue de Nginx
    Desde el log de Az DevOps, o desde la consola de AWS, obtenemos la url del servicio.
    Accedemos a la web del servicio

- Lanzamos el Pipeline de despliegue de CvOnline
    Desde el log de Az DevOps, o desde la consola de AWS, obtenemos la url del servicio.
    Accedemos a la web del servicio    
    
-----------------------------------------
HERRAMIENTAS DE MONITOREO
-----------------------------------------

- Asociamos el IAM Open ID Connect al Cluster
	.\set-eks-openID.ps1

- Agregamos las IAM policys de Fluentbit
    .\create-fluent-bit.policy.ps1
	
- Creamos el namespace de loggin y el IamServiceAccount
	.\add-eks-iam-service-account.ps1
	
    kubectl get serviceaccount -n logging
    kubectl -n logging describe sa fluent-bit

- Creamos el Cluster de OpenSearch
	.\create_open_search_cluster.ps1
	
- Mapeamos los roles de FluentBit a OpenSearch
	.\add-opensoearch-fluentbit-role.ps1
	
- Desplegamos Fluentbit
	.\add-fluent-bit-deploy.ps1
	
- Obtenemos informacion de acceso a opensearch
    ./get-opensearch-data.ps1
        Accedemos al sistema con esa info

- Desde la interfaz, buscamos el indice de fluent-bit
    [Explore on my own]
	private
    [connect to your OpenSearch index]
        *fluent-bit*
        @timestamp

    Desde [Discover], podemos ver las secciones asociados a ese index de fluent y visualizar los registros de performance que está recuperando.
  
- Desplegamos Prometheus y Grafana con HELM
    # Agregamos el repo de prometheus y grafana a Helm
    # Desplegar Prometheus
    # Creamos su namespace, Desplegamos Grafana y le creamos el datasource de prometheus
		.\add-prometheus-grafana.sh.ps1
		
# Podemos Exponer Prometheus en el 8080 de nuestra maquina
    kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090 --address 0.0.0.0

- Accedemos a Grafana con la PWD especificada en el despliegue

- Importamos el Dash 3119 para el monitoreo de Clusters, con Prometheus como datasource
- Importamos el Dash 6417 para el monitoreo de los Pods

- Pipeline de eliminacion del EC2
- Pipelinie de Eliminacion de EKS
- Eliminacion de Dominio de OpenSearch
- Pipeline de eliminacion del S3
