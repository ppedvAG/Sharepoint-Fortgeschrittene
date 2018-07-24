Add-PSSnapin "microsoft.sharepoint.powershell" -ErrorAction SilentlyContinue  

$webapp=Get-SPWebApplication -Identity http://sp2013:81
$webapp.GrantAccessToProcessIdentity("SPOINT/svcExcel")
