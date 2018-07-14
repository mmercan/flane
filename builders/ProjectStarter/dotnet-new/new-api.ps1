Import-Module .\new-dotnet.ps1 -Force

<<<<<<< HEAD
$folder = "Flane.Web.Api"
Write-Host "--------------------------------"
$scriptpath = $MyInvocation.MyCommand.Path 
$dir = Split-Path $scriptpath
$appRootFolder = Join-Path -Path $dir -ChildPath ..\..\..\prototypes\
$appFolder = Join-Path -Path $dir -ChildPath ..\..\..\prototypes\$folder


new-item -type directory -path $appFolder -Force
Write-Host "appFolder: $appFolder"

set-location -Path $appFolder
new-dotnet-Individual

Add-PushNotificationController
Add-TokenController
Add-SignalR
dotnet restore
dotnet build
Add-corsswagger-startupcs

=======
Add-Folder "AWWeb.Web.Sts"
Write-Host

$appRootFolder
set-location $appRootFolder

#new-dotnet
>>>>>>> a18b4cc... builder module created
