#!/bin/bash

set -e

echo "🔧 Iniciando dependências do Coolify..."

# Aguarda o PostgreSQL estar pronto
until pg_isready -h postgres -p 5432 -U coolify; do
  echo "⏳ Aguardando PostgreSQL..."
  sleep 2
done

# Aguarda o Redis estar pronto
until nc -z redis 6379; do
  echo "⏳ Aguardando Redis..."
  sleep 2
done

echo "✅ Dependências prontas. Iniciando Coolify..."

exec npm run start
