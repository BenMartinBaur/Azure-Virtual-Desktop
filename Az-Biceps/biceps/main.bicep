targetScope = 'subscription'

/*Define all WVD deployment parameters*/
param resourceGroupPrefrix string = 'RG-TEST-CUSTOMER'
param hostpoolName string = 'myBicepHostpool'
param hostpoolFriendlyName string = 'My Bicep deployed Hostpool'
param appgroupName string = 'myBicepAppGroup'
param appgroupNameFriendlyName string = 'My Bicep deployed Appgroup'
param workspaceName string = 'myBicepWorkspace'
param workspaceNameFriendlyName string = 'My Bicep deployed Workspace'
param preferredAppGroupType string = 'Desktop'
param wvdbackplanelocation string = 'westeurope'
param hostPoolType string = 'pooled'
param loadBalancerType string = 'BreadthFirst'
param logAnalyticsWorkspaceName string = 'myNinjaBicepLAWorkspace'

/* 
Define Azure Files deployment parameters
param storageaccountlocation string = 'westeurope'
param storageaccountName string = 'bicepsa'
param storageaccountkind string = 'FileStorage'
param storgeaccountglobalRedundancy string = 'Premium_LRS'
param fileshareFolderName string = 'profilecontainers'
*/

//Create Resource Group
resource rgwvd 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: '${resourceGroupPrefrix}CUSTOMER'
  location: 'westeurope'
}

//Create WVD backplane objects
module wvdbackplane './wvd-backplane-module.bicep' = {
  name: 'wvdbackplane'
  scope: rgwvd
  params: {
    hostpoolName: hostpoolName
    hostpoolFriendlyName: hostpoolFriendlyName
    appgroupName: appgroupName
    appgroupNameFriendlyName: appgroupNameFriendlyName
    workspaceName: workspaceName
    workspaceNameFriendlyName: workspaceNameFriendlyName
    preferredAppGroupType: preferredAppGroupType
    applicationgrouptype: preferredAppGroupType
    wvdbackplanelocation: wvdbackplanelocation
    hostPoolType: hostPoolType
    loadBalancerType: loadBalancerType
    //logAnalyticsWorkspaceName: logAnalyticsWorkspaceName
    //logAnalyticsResourceGroup: rdmon.name
    wvdBackplaneResourceGroup: rgwvd.name
  }
}
