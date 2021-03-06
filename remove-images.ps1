$imagelist = 'microsoft/dotnet' , 'microsoft/mssql-server-windows-developer', 'docker4w/nsenter-dockerd'

. ./ConvertFromDocker.ps1

$containers = docker image list   -a --no-trunc | ConvertFrom-Docker

$filteredContainers = $containers | Where-Object {$imagelist -notcontains $_.Repository} 
$filteredContainers |format-table
$filteredContainersIds = $filteredContainers| Select-Object ImageId
$filteredContainersIds

#delete containers before deleting the images
#docker rm $(docker ps -a -q)

#delete images
#docker rmi $filteredContainersIds