Param  
(  
    [Parameter (Mandatory = $false)]  
    [object] $WebhookData  
)  
 
# If runbook was called from Webhook, WebhookData will not be null.  
if ($WebhookData) { 

    Write-Output "Logging into Azure subscription using a Managed Identity..."
    # Ensures you do not inherit an AzContext in your runbook
    Disable-AzContextAutosave -Scope Process

    # Connect to Azure with system-assigned managed identity
    $AzureContext = (Connect-AzAccount -Identity).context

    # Set and store context
    $AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext   
   
    Write-Output "Successfully logged into Azure subscription using a Managed Identity..."
    Write-Output "Hello Azure - I am connected now"

    $tags = @{
        managed = 'true'
        avd = 'true'
    }

	$VMs = Get-AzVM -Status | Where-Object {($_.tags.managed -eq $tags.managed)}  

	foreach ($vm in $VMs){
		if($vm.PowerState -eq 'VM running'){
			Write-Warning "PowerStates for VM: $($vm.Name) is: $($vm.PowerState) initiate de-allocation for cost optimization"
			Stop-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName -Confirm:$false -Force
		}
		else{
			Write-Warning "No Action"
		}
	}
}