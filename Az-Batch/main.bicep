targetScope = 'subscription'

param name string
param location string = deployment().location
param tags object
param aadJoin bool
param vnetAddressPrefix string
param snetAddressPrefix string
param localAdminName string
@secure()
param localAdminPassword string
param maxSessionLimit int = 999999
param vmSize string
param vmCount int = 1
param vmLicenseType string
param dnsServer string = ''

resource resourceGroup 'Microsoft.Resources/resourceGroups@2020-01-01' = {
  name: 'rg-${name}'
  location: location
  scope: subscription()
  tags: tags
}

module networkSecurityGroup 'modules/networkSecurityGroup.bicep' = {
  name: 'networkSecurityGroupDeploy'
  scope: resourceGroup
  params: {
    name: name
    tags: tags
    location: location
  }
}

module virtualNetwork 'modules/virtualNetwork.bicep' = {
  name: 'virtualNetworkDeploy'
  scope: resourceGroup
  params: {
    name: name
    tags: tags
    location: location
    vnetAddressPrefix: vnetAddressPrefix
    snetAddressPrefix: snetAddressPrefix
    snetName: 'sn-${name}'
    dnsServer: (aadJoin ? '' : dnsServer)
    networkSecurityGroupId: networkSecurityGroup.outputs.id
  }
}
