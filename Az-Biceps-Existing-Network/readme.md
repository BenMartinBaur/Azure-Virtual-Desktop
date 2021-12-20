1. Deployment into a existing network
2. AAD only 
3. Parameter file for Cx environment data

Prerequisits
1. az bicep install
or update  az bicep upgrade

2. Login into Azure 
az login

3. If working with multiple subscriptions set your subscription
az account set --subscription 'Your subscription'

4. Since the network infrastructure is already deployed, get the network ID with 
az network vnet subnet list --resource-group rg-bebaur-vnet --vnet-name test --query "[?name=='YourSubnet'].id"

Ready to run? 

5. Update and set the parameters-aad-join-example.json
6. Update and set the main.bicep parameters.
7. Run

$location = "WestEurope"
$name=""
$localAdminName=""
$localAdminPassword=""
az deployment sub create --location $location -f ./main.bicep --parameters name=$name localAdminName=$localAdminName localAdminPassword=$localAdminPassword --parameters @parameters-aad-join-example.json -c

Updated version from pauldotyu :)