# Azure Virtual Desktop - Micro Hack

## Introduction

This hack is designed to help you get hands-on experience with Azure Virtual Desktop (AVD) and to ramp up for the AZ-140 AVD specialst certification. 

AVD – is a born-in-the-cloud desktop-as-a-service platform service offered entirely on our Microsoft Intelligent Cloud. 
All traditional infrastructure services such as brokering, web access, load balancer, management and monitoring are part of the AVD control plane and can be configured from the Azure portal or via the Azure Resource Manager (ARM)

AVD has quickly gained adoption across the globe with companies moving to remote work for their employees. 

This hack covers all essential artifacts of AVD and starts off by covering the basics and then digs deep into the different componets. You will encounter different types of solutions that is or could be needed in a AVD environment. 

## Learning Objectives

In this hack you will learn how to set up a Azure Virtual Desktop in a typical scenario and build it out in your own environment. Once your AVD environment is built you will learn how to scale. monitor and manage the environment with other Azure resources. 

## Challenges

- Challenge 0: **[Getting started](Challenges/00-Pre-Reqs.md)**
- Challenge 1: **[Deploy a personal session host](Challenges/01-Plan-AVD-Architecture.md)**
- Challenge 2: jumpbox - remote apps (multi-session RDP verbinden, Notepad deployen, Image erstellen, in image gallery laden und 2 Session hosts mit dem image deployen)
- Challenge 3: FSLogix (Azure Files joined in AAD provided to attendees) 
- Challenge 4: Implement „start VM on connect“ (single-session) 
- Challenge 5: Setup scaling-plan (multi-session)
- Challenge 6: **[Configure RDP Properties](Challenges/06-RDP-properties.md)**
- Challenge 7 (optional): Monitoring (Log Analytics workspace required)
- Challenge 8 (optional): disaster recovery & backup for AVD (failover / replicate in other region) 
- Challenge 9 (optional): conditional access (MFA required)


## Prerequisites

- Azure Subscription
- Visual Studio Code (https://code.visualstudio.com/)
- Visual Studio Biceps Extension installed
- Azure CLI 
- [M365 License](https://docs.microsoft.com/en-us/azure/virtual-desktop/overview#requirements)

## Repository Contents

## Contributor
- Ben Martin Baur
- Angelika Gerl
- Leonie Mueller