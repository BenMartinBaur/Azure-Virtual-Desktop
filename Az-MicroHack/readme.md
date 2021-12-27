# Azure Virtual Desktop - Micro Hack

## Introduction

This hack is designed to help you get hands-on experience with Azure Virtual Desktop (AVD) and to ramp up for the AZ-140 AVD specialst certification. 

AVD – is a born-in-the-cloud desktop-as-a-service platform service offered entirely on our Microsoft Intelligent Cloud. 
All traditional infrastructure services such as brokering, web access, load balancer, management and monitoring are part of the AVD control plane and can be configured from the Azure portal or via the Azure Resource Manager (ARM)

AVD has quickly gained adoption across the globe with companies moving to remote work for their employees. 

This hack covers all essential artifacts of AVD and starts off by covering the basics and then digs deep into the different componets. You will encounter different types of solutions that is or could be needed in a AVD environment. 

AGENDA: 

Challenges 0-7 should be done in order, 8-11 can be done randomly once 0-7 are completed. 

## Learning Objectives

In this hack you will learn how to set up a Azure Virtual Desktop in a typical scenario and build it out in your own environment. Once your AVD environment is built you will learn how to scale. monitor and manage the environment with other Azure resources. 

## Challenges

- Challenge 0: **[Getting started](Student/00-Pre-Reqs.md)**
- Challenge 1: **[Design the AVD Architecture](Student/01-Plan-AVD-Architecture.md)**
- Challenge 2: **[Implement and Manage Networking for AVD](Student/02-Implement-Manage-Network.md)**
- Challenge 3: **[Implement and Manage your Storage for FSLogix](Student/03-Implement-Manage-Storage.md)**
- Challenge 4: **[Create and Manage Images](Student/04-Create-Manage-Images.md)**
- Challenge 5: **[Create and Configure Host Pools and Session Hosts](Student/05-Create-Configure-HostPools.md)**
- Challenge 6: **[Addressing User Profiles with FSLogix](Student/06-Implement-Manage-FsLogix.md)**
- Challenge 7: **[Install and Configure your Applications](Student/07-Install-Configure-Apps.md)**
- Challenge 8: **[Plan and Implement BCDR](Student/08-Plan-Implement-BCDR.md)**
- Challenge 9: **[Automate AVD Tasks](Student/09-Automate-AVD-Tasks.md)**
- Challenge 10: **[Monitor and Manage the Performance and Health of your AVD Environment](Student/10-Monitor-Manage-Performance-Health.md)**
- Challenge 11: **[Configure Settings for User Experience](Student/11-Configure-User-Experience-Settings.md)**

## Prerequisites

- Azure Subscription
- Visual Studio Code (https://code.visualstudio.com/)
- Visual Studio Biceps Extension installed
- Azure CLI 
- [M365 License](https://docs.microsoft.com/en-us/azure/virtual-desktop/overview#requirements)
- [Azure Academy Az-140 Study Guide](https://aka.ms/AzureAcademy-AZ140)

## Repository Contents

- `../Coach/Solutions`
   - Example solutions to the challenges (If you're a student, don't cheat yourself out of an education!)
- `../Student/Resources`
   - Scripts and code templates to help aide with the challenges
