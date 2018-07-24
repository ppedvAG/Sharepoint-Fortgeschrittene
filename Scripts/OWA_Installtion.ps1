######auf OWA Server

Add-PSSnapin "microsoft.sharepoint.powershell" -ErrorAction SilentlyContinue  
Add-WindowsFeature Web-Server,Web-WebServer,Web-Common-Http,Web-Static-Content,Web-App-Dev,Web-Asp-Net,Web-Net-Ext,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,Web-Security,Web-Windows-Auth,Web-Filtering,Web-Stat-Compression,Web-Dyn-Compression,Web-Mgmt-Console,Ink-Handwriting,IH-Ink-Support


New-OfficeWebAppsFarm –InternalURL http://spowa–AllowHttp –EditingEnabled


##auf SP Server
Get-SPWOPIBinding
Remove-SPWOPIBinding  -all
New-SPWOPIBinding -ServerName spowa -AllowHTTPSet-SPWopiZone –zone “internal-http”


#Bei Problemen hat dies oft geholfen:(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp$config = (Get-SPSecurityTokenServiceConfig)$config.AllowOAuthOverHttp = $true$config.Update()(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp

###### -Bei Problemen
(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp
$config = (Get-SPSecurityTokenServiceConfig)
$config.AllowOAuthOverHttp = $true
$config.Update()
(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp


Remove-SPWOPIBinding -All