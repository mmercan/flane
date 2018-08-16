#COMPOSE_CONVERT_WINDOWS_PATHS 0
# $scriptpath = $MyInvocation.MyCommand.Path
# $dir = Split-Path $scriptpath
# $apiFolder = Join-Path -Path $dir -ChildPath .\dockapp

#delete all images
#docker rmi $(docker images -a -q)
#delete all containers
#docker rm $(docker ps -a -q)

#docker-compose -f docker-compose.yml -f docker-compose.develop.yml up --build Flane.Web.STS
docker-compose -f docker-compose.yml -f docker-compose.develop.yml up --build  Flane-Web-STS