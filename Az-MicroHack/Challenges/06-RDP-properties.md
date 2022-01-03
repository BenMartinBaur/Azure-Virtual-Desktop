# RDP Properties

[Previous Challenge](./00-Pre-Reqs.md) - **[Home](../README.md)** - [Next Challenge](./xxx.md)

## Introduction
Azure Virtual Desktop enables you to configure and customize Remote Desktop Protocol (RDP) properties for a host pool. This 

Customizing a host pool's Remote Desktop Protocol (RDP) properties, such as multi-monitor experience and audio redirection, lets you deliver an optimal experience for your users based on their needs. If you'd like to change the default RDP file properties, you can customize RDP properties in Azure Virtual Desktop by either using the Azure portal or by using the -CustomRdpProperty parameter in the Update-AzWvdHostPool cmdlet.

## Challenge 
- Personal Hostpool
    - Deny Storage, networkdrive and printers redirection.
    - Allow Camera,  Microphone and Copy&Paste.
- Remote App Pool 
    - Deny Camera, Microphone and Copy&Past.
    - Allow Storage and networkdrive and printer redirection.

## Success Criteria
- Host Pools are created and Session Hosts showing available
- Users are assigned to the HostPool's appropriate app group
- You can not access local or networkdrives redirected from the personal hostpool
- You can not Copy and Paste from you local devices to the Remote Applications.

## Learning Resources
[Customize RDP Properties](https://docs.microsoft.com/en-us/azure/virtual-desktop/customize-rdp-properties)