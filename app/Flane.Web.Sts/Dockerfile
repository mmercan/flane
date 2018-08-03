FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1709 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk-alpine AS develop-linux
ENV DOTNET_USE_POLLING_FILE_WATCHER=1
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /src/Flane.Web.Sts
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk-nanoserver-1709 AS build
WORKDIR /src
COPY Flane.Web.Sts/Flane.Web.Sts.csproj Flane.Web.Sts/
RUN dotnet restore Flane.Web.Sts/Flane.Web.Sts.csproj
COPY . .
WORKDIR /src/Flane.Web.Sts
RUN dotnet build Flane.Web.Sts.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Flane.Web.Sts.csproj -c Release -o /app

FROM base AS final
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Flane.Web.Sts.dll"]
