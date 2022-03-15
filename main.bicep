targetScope = 'subscription'
var deploymentname = 'deployment1'
var deploymentId = '${uniqueString(deploymentname)}'
param location string
param vnetName string
param subnet array
param rgName1 string

module rg './arm/Microsoft.Resources/resourceGroups/deploy.bicep' = {
  name: deploymentId
  params: {
    location: location
    name: rgName1
  }
}

module vNet './arm/Microsoft.Network/virtualNetworks/deploy.bicep' = {
  name: deploymentId
  scope: resourceGroup(rgName1)
  params: {
    location: location
    name: vnetName
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    subnets: subnet
  }
}
