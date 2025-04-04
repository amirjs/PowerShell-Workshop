Install-Module -Name Microsoft.Graph.Authentication -force
Install-Module -Name Microsoft.Graph.Users -force
install-module -name microsoft.graph.devicemanagement -force
Import-Module Microsoft.Graph.authentication
Import-Module Microsoft.Graph.Users

connect-mggraph -Scopes "User.Read.All"

Get-MgContext

# GO TO AZURE AND FIND YOUR USER OBJECT ID
$userid = "a3a0d6bb-9c2f-4a3c-9732-836410fe7ef1"
Get-MgUser -UserId $userId | fl

#find devices that match a name pattern

Get-MgDevice -Filter "startswith(DisplayName, 'EUDUKPN')" -All | select displayname
