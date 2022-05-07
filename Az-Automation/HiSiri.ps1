Param  
(  
    [Parameter (Mandatory = $false)]  
    [object] $webhookData  
)  

# If runbook was called from webhook, webhookData will not be null.
if ($webhookData) { 

    Write-Output "Logging into Azure subscription using Az cmdlets..."
        
    $connectionName = "AzureRunAsConnection"
    try
    {
        # Get the connection "AzureRunAsConnection "
        $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

        Add-AzAccount `
            -ServicePrincipal `
            -TenantId $servicePrincipalConnection.TenantId `
            -ApplicationId $servicePrincipalConnection.ApplicationId `
            -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
        
        Write-Output "Successfully logged into Azure subscription using Az cmdlets..."
    }

    catch {
        if (!$servicePrincipalConnection)
        {
            $ErrorMessage = "Connection $connectionName not found."
            throw $ErrorMessage
        } else{
            Write-Error -Message $_.Exception
            throw $_.Exception
        }
    }

    Write-Output "Hello Azure I am connected now"

	# Get tagged VMs
	$TaggedVMs = Get-AzVM -Status | Where-Object {($_.tags.HiSiri -eq 'enabled')}
	# Write-Output = "$TaggedVMs"

	foreach ($TaggedVM in $TaggedVMs){
		if ($TaggedVM.PowerState -ne 'VM running') {
				Start-AzVM -Name $TaggedVM.Name -ResourceGroupName $TaggedVM.ResourceGroupName
				Write-Warning "Siri started VM $($TaggedVM.Name)"
		}
		else {
			Write-Warning "Hey... there is nothing to do for me"
		}
	}
}