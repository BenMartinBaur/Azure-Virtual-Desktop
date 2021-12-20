targetScope = 'subscription'

param name string
param rgname string = 'rg-spoke-${name}'
param location string = deployment().location
param tags object
param aadJoin bool
param localAdminName string
@secure()
param localAdminPassword string
param vmSize string
param vmCount int = 4
param vmLicenseType string
param virtualNetwork string
param domainToJoin string = ''
param domainUserName string = ''
@secure()
param domainPassword string = ''
param ouPath string = ''

resource resourceGroup 'Microsoft.Resources/resourceGroups@2020-01-01' = {
  name: rgname
  location: location
  scope: subscription()
  tags: tags
}

module hostPool 'modules/hostPools.bicep' = {
  scope: resourceGroup
  name: 'hostPoolDeploy'
  params: {
    name: name
    tags: tags
    location: location
    aadJoin: aadJoin
    hostPoolType: 'Pooled'
  }
}

module applicationGroup 'modules/applicationGroup.bicep' = {
  scope: resourceGroup
  name: 'applicationGroupDeploy'
  params: {
    name: name
    tags: tags
    location: location
    hostPoolId: hostPool.outputs.id
  }
}

module workspace 'modules/workspace.bicep' = {
  scope: resourceGroup
  name: 'workspaceDeploy'
  params: {
    name: name
    tags: tags
    location: location
    applicationGroupId: applicationGroup.outputs.id
  }
}

module sessionHost 'modules/sessionHost.bicep' = {
  scope: resourceGroup
  name: 'sessionHostDeploy'
  params: {
    name: name
    tags: tags
    location: location
    localAdminName: localAdminName
    localAdminPassword: localAdminPassword
    vmSize: vmSize
    count: vmCount
    licenseType: vmLicenseType
    aadJoin: aadJoin
    domainToJoin: domainToJoin
    domainPassword: domainPassword
    domainUserName: domainUserName
    ouPath: ouPath
    vnetId: virtualNetwork
  }

  dependsOn: [
    hostPool
  ]
}

