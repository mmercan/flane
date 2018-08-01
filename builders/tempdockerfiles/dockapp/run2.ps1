
#docker rmi $(docker images -a -q)

docker rm $(docker ps -a -q)

#docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:C:\app\ -w C:\app\myapp microsoft/dotnet:2.1-sdk dotnet watch run --no-launch-profile --configuration Debug
#docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:C:\app\ -w C:\app\myapp microsoft/dotnet:2.1-sdk cmd
#docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:C:\app\ -w /app/myapp microsoft/dotnet:2.1-sdk dotnet watch run --no-launch-profile --configuration Debug
# docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:c:\app microsoft/dotnet:2.1-sdk dotnet watch --project C:\app\myapp run  --no-launch-profile --configuration Debug

#docker build ./ -t my-server -f dockerfile.develop2
# docker run --rm -it -p 5000:80 -v "$(pwd)/myapp:/code/app" my-server
#docker run --rm -it -p 8000:80 -v c:\git\dotnet-docker\samples\aspnetapp:/app/ -w /app/aspnetapp microsoft/dotnet:2.1-sdk dotnet watch run


# docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:C:\src\ -w /src/myapp microsoft/dotnet:2.1-sdk  dotnet watch run --verbose --no-launch-profile --configuration Debug
docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:/src/ -w /src/myapp microsoft/dotnet:2.1-sdk-alpine  dotnet watch run --verbose --no-launch-profile --configuration Debug



# docker run --rm -it -p 8000:80 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:c:\src microsoft/dotnet-nightly:2.1-sdk  dotnet watch --project c:\src\myapp run --verbose --no-launch-profile --configuration Debug
# docker run --rm -it -p 8000:80 --env DOTNET_USE_POLLING_FILE_WATCHER=1 --env ASPNETCORE_ENVIRONMENT=Development -v C:\Repositories\flane\prototypes\dockerplay\dockapp:C:\src microsoft/dotnet:2.1-sdk-nanoserver-1709  dotnet watch --project C:\src\myapp run --verbose --no-launch-profile --configuration Debug