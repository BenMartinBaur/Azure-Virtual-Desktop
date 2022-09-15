# Azure Virtual Desktop - Boosterpack

## Introduction

This code is designed to help you spin up an Azure Virtual Desktop Demo environement.

AVD – is a born-in-the-cloud desktop-as-a-service platform service offered entirely on our Microsoft Intelligent Cloud. 
All traditional infrastructure services such as brokering, web access, load balancer, management and monitoring are part of the AVD control plane and can be configured from the Azure portal or via the Azure Resource Manager (ARM).

## Objectives

1. Deploy Azure Virtual Desktop Sessionhosts in a new virtual network
2. All session hosts are AAD joined only
3. Use the parameter-aad-join-example.json to provide additional variables.
4. (Coming soon) configure role assignments and FSLogix. 

In this hack you will learn how to set up a Azure Virtual Desktop in a typical scenario and build it out in your own environment. Once your AVD environment is built you will learn how to scale. monitor and manage the environment with other Azure resources. 

## Prerequisites

- Azure Subscription
- Visual Studio Code (https://code.visualstudio.com/)
- Visual Studio Biceps Extension installed
- Azure CLI 
- [M365 License](https://docs.microsoft.com/en-us/azure/virtual-desktop/overview#requirements)

## Task 1: Deploy
Steps:
- Log in to Azure Cloud Shell at https://shell.azure.com/ and select Bash

  `az login`

- Ensure Azure CLI and extensions are up to date:

  `az upgrade --yes`

  `az biceps upgrade ` or `az biceps install` (to install it)
  
- If necessary select your target subscription:
  
  `az account set --subscription <Name or ID of subscription>`

- Update and set the `parameters-aad-join-example.json`
- Update and set the `main.bicep` parameters.

- Run the deployment with e.g. 

`$location = "WestEurope"`

`$name="<your name>"`

`$localAdminName="<your local admin>"`

`$localAdminPassword="<your local admin password>"`

`az deployment sub create --location $location -f ./main.bicep --parameters name=$name localAdminName=$localAdminName localAdminPassword=$localAdminPassword --parameters @parameters-aad-join-example.json -c`
