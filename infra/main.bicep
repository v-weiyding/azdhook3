targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  
  name: 'rg-${environmentName}'
  location: location
}

// Store secrets in a keyvault
module storageAccount './storage-account.bicep' = {
  name: 'storageAccount'
  scope: rg
  params: {
    name:'tomstorage'
  }
}
