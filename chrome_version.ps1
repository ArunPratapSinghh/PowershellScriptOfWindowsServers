########### Chrome Version on Windows Version ###############

$list = Get-content -Path C:\temp\Server_list.txt

foreach($VM in $list)
{

  $Chrome_version = Invoke-command -ComputerName $VM -scriptblock {

                    Get-Package -Name "Google Chrome" |
                      Select-Object @{Name="ServerName";E={$env:ComputerName}},Name,Version

                      } 

}

Write-Host "Script has been completed" -ForgroundColor Green

