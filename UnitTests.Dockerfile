FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app
COPY . .
RUN dotnet restore

ENTRYPOINT ["dotnet", "test", "TeamCityDocker.UnitTests/TeamCityDocker.UnitTests.csproj"]