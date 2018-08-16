FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1709 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk-alpine AS develop-linux
ENV DOTNET_USE_POLLING_FILE_WATCHER=1
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /src/flanewebsts
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk-nanoserver-1709 AS build
WORKDIR /src
COPY myapp/dockapp.csproj myapp/
RUN dotnet restore myapp/dockapp.csproj
COPY . .
WORKDIR /src/myapp
RUN dotnet build dockapp.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish dockapp.csproj -c Release -o /app

FROM base AS final
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "dockapp.dll"]
