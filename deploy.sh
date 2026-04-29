#!/bin/bash
# Uso: bash deploy.sh

set -e

echo "==> Actualizando código..."
git pull origin master

echo "==> Deteniendo contenedores..."
docker-compose -f docker-compose.production.yml down

echo "==> Reconstruyendo e iniciando contenedores..."
docker-compose -f docker-compose.production.yml up -d --build

echo "==> Desplegado en http://<IP_OCI>:8088"
