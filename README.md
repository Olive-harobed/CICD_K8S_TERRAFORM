# Microservices-based Architecture Deployment using Kubernetes and Infrastructure as Code (IaaC)
This project demonstrates the deployment of a microservices-based architecture on Kubernetes using Infrastructure as Code (IaaC) approach. The application includes a webapp with an nginx frontend proxy and a database backend - mongodb. Additionally, the Socks Shop example microservice application is also deployed.

## Deployment Approach
The deployment approach for this project emphasizes readability, maintainability, and DevOps methodologies. The following tools were used for deployment:

- EKS (Elastic Kubernetes Service) as the Kubernetes cluster provider
- GitHub Actions pipeline for continuous integration and deployment
- Prometheus as the monitoring tool
- Grafana for visualization of Prometheus metrics
- EFK (Elasticsearch, Fluentd, and Kibana) for logging
- Terraform for setting up the EKS cluster and infrastructure as code configuration management tool

## Prerequisites
- AWS account with access to EKS
- GitHub account
- Kubernetes CLI (kubectl) installed
- Terraform CLI installed

### Step 1: Deploying the EKS Cluster
The Terraform files for deploying the EKS cluster are located in the **`terraform`** directory. These files have already been configured to set up the necessary infrastructure on AWS.

The deployment is handled through GitHub Actions, so there's no need to manually set up the cluster. Whenever code is pushed to the GitHub repository, the Actions pipeline will automatically execute the Terraform commands to create the EKS cluster and the necessary networking components on AWS.

### Step 2: Deploying the Applications
The Kubernetes manifests for the webapp, nginx frontend proxy, mongo database backend are located in the **`webapp`** directory and Socks Shop microservice application manifest is located in the **`sockapp`** directory.

The deployment is also handled through GitHub Actions. Whenever code is pushed to the GitHub repository, the Actions pipeline will automatically execute the kubectl apply command to deploy the applications to the EKS cluster.

### Step 3: Setting up Monitoring with Prometheus and Grafana
The Kubernetes manifests for Prometheus and Grafana are located in the **`manifests-monitoring`** directory. These manifests have already been configured to deploy and set up both Prometheus and Grafana.

After the applications are deployed, access the Grafana dashboard to visualize the Prometheus metrics.

### Step 4: Setting up Logging with EFK
The Kubernetes manifests for Elasticsearch, Fluentd, and Kibana are located in the **`logging`** directory. These manifests have already been configured to deploy and set up EFK logging.

After the applications are deployed, access the Kibana dashboard to view the logs.

### Step 5: Testing the Webapp
The Node.js webapp can be accessed at `portfolio.deb-ops.live` and tested by the /api endpoint.
![image](https://user-images.githubusercontent.com/79452458/228980772-bdc9bbfc-591e-4720-b86c-52a3453f202c.png)


### Step 6: Testing the Sockapp
The Socks Shop can be accessed at `sockshop.deb-ops.live`.
![image](https://user-images.githubusercontent.com/79452458/228981336-91185cf2-bdd1-440f-a282-9c373c034961.png)


### Step 6: Monitoring
The prometheus dashboard is accessed at `prometheus.deb-ops.live:9090` while the grafana dashboard is at `grafana.deb-ops.live`
![image](https://user-images.githubusercontent.com/79452458/228981601-5a9ae339-2a8f-4e76-a8e8-c9cb69330a8c.png)
![image](https://user-images.githubusercontent.com/79452458/228981634-7f66f225-82eb-495a-9c8f-f258de8e461a.png)
![image](https://user-images.githubusercontent.com/79452458/228983689-f353388d-eef7-4c18-bbcf-3f8a61e3cfdf.png)
![image](https://user-images.githubusercontent.com/79452458/228983836-4f2aea85-7f95-4223-8bda-a12e5d3e2786.png)


### Step 7: Logging
The Kibana dashboard is accessed at `kibana.deb-ops.live:5601`

## Conclusion
This project demonstrates the deployment of a microservices-based architecture on Kubernetes using Infrastructure as Code. By automating the deployment process with GitHub Actions and Terraform, the project emphasizes maintainability, readability, and DevOps methodologies. With Prometheus and Grafana for monitoring and EFK for logging, the project provides a comprehensive solution for managing a Kubernetes deployment.

