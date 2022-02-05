param name string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: 'rbac${name}'
  properties: {
    roleDefinitionId: 'string'
    principalId: 'string'
    principalType: 'string'
    description: 'string'
    condition: 'string'
    conditionVersion: 'string'
    delegatedManagedIdentityResourceId: 'string'
  }
}

/*
resource rgOwner 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: '${guid(rg.name, 'owner')}'
  scope: rg
  properties: {
    roleDefinitionId: '${subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8e3af657-a8ff-443c-a75c-2fe8c4bcb635')}'
    principalId: groupOwnerId
    principalType: 'Group'
  }
}
*/
