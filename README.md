# finalproject_celebal_technologies
# Azure Container Deployment with Azure DevOps

This project demonstrates the deployment of a Node.js application to Azure Container Instances (ACI) using Azure DevOps CI/CD pipelines.

## Prerequisites

1. **Azure Subscription**: An active Azure account.
2. **Azure DevOps Account**: An active Azure DevOps organization.
3. **Azure CLI**: Installed and configured on your machine.
4. **Docker**: Installed and running on your machine.

## Project Structure

- **/src**: Contains the source code for the Node.js application.
- **Dockerfile**: Defines the Docker image for the application.
- **azure-pipelines.yml**: CI pipeline configuration for Azure DevOps.
- **scripts/deploy-aci.sh**: Script to deploy the container to Azure Container Instances.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository_url>
cd azure-container-deployment
```

### 2. Build and Push Docker Image

- Run the following command to build and push the Docker image to Azure Container Registry:

```bash
az acr build --registry <your-acr-name> --image azure-container-app .
```

### 3. Azure DevOps Pipelines

#### a. CI Pipeline

1. Navigate to Pipelines in Azure DevOps.
2. Create a new pipeline and connect it to your repository.
3. Use the existing `azure-pipelines.yml` to set up the CI pipeline.

#### b. CD Pipeline

1. Set up a new release pipeline in Azure DevOps.
2. Add an artifact from the CI pipeline.
3. Add a stage and include a script task to run `scripts/deploy-aci.sh`.

### 4. Deployment

- On each commit to the main branch, the CI pipeline builds and pushes the Docker image.
- The release pipeline deploys the new image to Azure Container Instances.

## Monitoring and Scaling

Monitor your application via the Azure portal and adjust the resources as necessary.

## Cleanup

To remove the deployed resources, delete the resource group:

```bash
az group delete --name <your-resource-group-name> --yes --no-wait
```

## License

This project is licensed under the MIT License.
