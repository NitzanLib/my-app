# Counter Service
A simple Flask-based counter service the increments a counter on every POST request and returns the count value for every GET request.

Why count yourself when you have the Counter Service?

## Table of Contents

- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Uninstallation](#uninstallation)
- [Additional Resources](additional-resources)

## Repository Structure

```
my-app/
├── Dockerfile                   # Dockerfile of the counter-servie image
├── README.md                    # This file
├── counter-service.py           # The Python counter-service application
├── requirements.txt             # Python dependencies for the application
└── helm/
    └── counter-service/         # Helm chart for deploying counter-service
        ├── Chart.yaml           # Helm chart metadata
        ├── charts/              # Directory for subcharts
        ├── templates/           # Kubernetes manifest templates
        │   ├── _helpers.tpl     # Helper templates for the chart
        │   ├── deployment.yaml  # Deployment manifest for the counter-service
        │   ├── ingress.yaml     # Ingress manifest for the counter-service
        │   └── service.yaml     # Service manifest for the counter-service
        └── values.yaml          # Default values for the Helm chart
```

## Prerequisites

- **Docker**: Installed and configured for building container images.
- **Helm**: Installed for deploying the application to Kubernetes.
- **AWS CLI**: Installed and configured with proper credentials for pushing to ECR and accessing EKS.
- An AWS account with EKS and and existing ECR set up.
- (Optional) GitHub Actions enabled for CI/CD automation.

## Installation

**To install the project locally, follow these steps:**

1. Clone the repository:
   ```bash
   git clone https://github.com/NitzanLib/my-app
   ```
2. Navigate to the project folder:
   ```bash
   cd counter-service
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Run the application:
   ```bash
   python counter-service.py
   ```

**To install the application to your [my-infra](https://github.com/NitzanLib/my-inra) infrastructure, follow these steps:**

1. Build and Push the Docker Image:

- ```bash
  aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-ecr-registry>
  ```

2. Build the Docker image:

- ```bash
  docker build -t <your-ecr-registry>/counter-service:v1.0.0 .
  ```
3. Push image to ECR:
- ```bash
  docker push <your-ecr-registry>/counter-service:v1.0.0
  ```


**Install the Application Using Helm**

1.  ```bash
    helm upgrade --install counter-service helm/counter-service \
  --namespace <your-namespace> \
  --create-namespace \
  --set image.repository=<your-ecr-registry>/counter-service \
  --set image.tag=v1.0.0
  ```

**Deploy Using Github Actions**

The Github Workflow provided in ```.github/workflows/deploy.yml``` automates the process of building the docker image, pushing it to ECR and deploying the application via Helm when change are pushed to the ```main``` branch.

**Prerequisites**
- Ensure the following GitHub Secrets are configured in your repository:
  - ```AWS_ACCESS_KEY_ID```
  - ```AWS_SECRET_ACCESS_KEY```

**Required Variables**

Configure the following variables in the Helm chart ```helm/counter-service/values.yaml```
   - ```image.repository```: The URL for your ECR Repository.
   - ```image.tag```: The Docker image tag (v1.0.0)


## Usage

After starting the service, you can interact with it via `POST` and `GET` requests:

- **POST Request**: Increments the counter.
  ```bash
  curl -X POST http://localhost:8080
  ```
  Response: `"Hmm, Plus 1 please"`

- **GET Request**: Returns the current counter value.
  ```bash
  curl http://localhost:8080
  ```
  Response: `"Our counter is: 5"`

## Uninstallation

To uninstall the counter-service application from your Kubernetes cluster, follow these steps:

1. **Uninstall the Helm Release:**

   Run the following command to remove the Helm release:
   ```bash
   helm uninstall counter-service --namespace <your-namespace>
   ```
2. **Verify the Uninstallation:**
   ```bash
   kubectl get all -n <your-namespace>
   ```

## Additional Resources

- [Docker Documentation](https://docs.docker.com)
- [Helm Documentation](https://helm.sh/docs/)
- [AWS ECR Documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)
- [AWS EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)


Let me know if you have any questions :]