FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copy csproj and restore
COPY ./src/VatesArcanum/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./src/VatesArcanum ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /.
COPY --from=build /app/out .

ENV ASPNETCORE_URLS=http://+:7600 ASPNETCORE_ENVIRONMENT=Development
EXPOSE 7600

# Change name of dll for your application 
ENTRYPOINT ["dotnet", "VatesArcanum.dll"]