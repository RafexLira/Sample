# ================================
# Etapa 1: build da aplicação
# ================================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia todo o repositório
COPY . .

# Restaura dependências
RUN dotnet restore

# Publica a API
RUN dotnet publish Sample.Api/Sample.Api.csproj -c Release -o /app/publish

# ================================
# Etapa 2: imagem final
# ================================
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copia o output do build
COPY --from=build /app/publish .

# Porta padrão da API
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

# Executa a API
ENTRYPOINT ["dotnet", "Sample.Api.dll"]
