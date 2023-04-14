Connect-AzAccount -Identity

$allResources = @()
$subscriptions = Get-AzSubscription

ForEach ($vsub in $subscriptions) {
    Select-AzSubscription $vsub.SubscriptionID 

    $allResources += $allResources | Select-Object $vsub.SubscriptionID, $vsub.Name

    $noneahbvm = Get-AzVM | where { $_.StorageProfile.OsDisk.OsType -eq "Windows" -and $_.licenseType -ne "Windows_Server" }
    foreach ($vm in $noneahbvm) {
        $name = $vm.Name
        $rg = $vm.ResourceGroupName
      
        Write-Output 'Enabling Azure Hybrid Benefit on VM:' $name  
        $vm.LicenseType = "Windows_Server"
        Update-AzVM -ResourceGroupName $rg -VM $vm 

    }
}