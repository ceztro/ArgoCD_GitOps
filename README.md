**Travel Guide ArgoCD GitOps Repository**

This repository contains the Kubernetes manifests for deploying the Travel Guide web application on an Amazon EKS cluster. The manifests are structured to work with ArgoCD in a GitOps setup, ensuring that the application’s deployment and lifecycle are managed automatically based on changes pushed to this repository.

**Project Overview**

The Travel Guide app is a Flask-based web application deployed on Amazon EKS. This repository defines the necessary Kubernetes resources (such as deployments, services, and ingress configurations) to manage the application’s lifecycle using ArgoCD.

With ArgoCD, changes to the application’s configuration and infrastructure are automatically synchronized from this repository to the Kubernetes cluster, ensuring seamless, continuous deployment.

**Key Features**

	•	GitOps-Driven Deployment: This repository is integrated with ArgoCD for continuous deployment, enabling automatic syncing of changes to the Kubernetes cluster.
	•	EKS Integration: The Kubernetes manifests deploy the application on an Amazon EKS cluster.
	•	ALB Ingress: Configured to use the AWS Application Load Balancer (ALB) for external access to the application.
	•	RDS Integration: The application connects to an RDS database, with credentials managed via AWS Secrets Manager.

**Repository Structure**

This repository contains the following key manifests:

	1.	Namespace: Defines the Kubernetes namespace where all resources are deployed.
	2.	Deployment: Manages the Flask web application, running on multiple replicas for scalability.
	3.	Service: Defines the ClusterIP service to route traffic to the application within the cluster.
	4.	Ingress: Configures an ALB ingress to expose the application to the internet.
	5.	Service Account: Configures service accounts and IAM roles to allow secure interaction with AWS services, including RDS and the ALB controller.
	6.	Auto-scaling (optional): Supports horizontal scaling of the application based on CPU and memory utilization.

**Key Technologies**

	•	ArgoCD: GitOps continuous deployment tool to automate the management of Kubernetes resources.
	•	Amazon EKS: Managed Kubernetes service where the application is hosted.
	•	AWS ALB Ingress Controller: Manages the AWS Application Load Balancer (ALB) to expose the application.
	•	AWS IAM Roles: Provides secure access to AWS services such as RDS and ALB using IAM roles with pod-level security via service accounts.
