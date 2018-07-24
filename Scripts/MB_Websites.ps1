$sc = get-spsite http://sp2013
$sc | get-member
 $sc.Usage
 Get-SPSite | select url, @{label="Size in MB";Expression={$_.usage.storage}}


 Get-SPSite | select url, @{label="Size in MB";Expression={$_.usage.storage/1MB}} | Sort-Object -Descending -Property "Size in MB" | Format-Table –AutoSize

 Get-SPSite | select url, @{label="Size in MB";Expression={$_.usage.storage/1MB}} | Sort-Object -Descending -Property "Size in MB" | ConvertTo-Html -title "Site Collections sort by size" | Set-Content c:\sc.html