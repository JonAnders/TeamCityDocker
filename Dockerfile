FROM node:10-alpine AS frontend-build
WORKDIR /app
COPY . .
WORKDIR /app/TeamCityDocker.Web
RUN npm run rairai


FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app
COPY --from=frontend-build /app .
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out ./TeamCityDocker.Web/*.csproj


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "TeamCityDocker.Web.dll"]