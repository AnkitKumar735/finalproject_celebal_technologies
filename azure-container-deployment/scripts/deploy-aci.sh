#!/bin/bash

# Variables
RESOURCE_GROUP="ResourceGroup"
ACI_NAME="ACIName"
ACR_NAME="acrname"
IMAGE_NAME="azure-container-app:$(Build.BuildId)"
LOCATION="eastus"
CPU=1
MEMORY=1

# Log in to Azure
az login --service-principal -u $SP_APPID -p $SP_PASSWORD --tenant $TENANT_ID

# Create or update the ACI instance
az container create \
  --resource-group $RESOURCE_GROUP \
  --name $ACI_NAME \
  --image $ACR_NAME.azurecr.io/$IMAGE_NAME \
  --cpu $CPU \
  --memory $MEMORY \
  --registry-login-server $ACR_NAME.azurecr.io \
  --registry-username $SP_APPID \
  --registry-password $SP_PASSWORD \
  --location $LOCATION \
  --dns-name-label my-app-$RANDOM
