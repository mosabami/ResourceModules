targetScope = 'subscription'
var deployment = 'deployment1'
var deploymentId = '${uniqueString(deployment)}'

module rg './arm/Microsoft.Resources/resourceGroups/deploy.bicep' = {
  name: deploymentId
  params: {
    location: 'westus'
    name: 'scenario1rg'
  }
}
