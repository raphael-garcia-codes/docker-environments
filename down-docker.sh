#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

services=(
  "postgres"
  "rabbitmq"
  "redis"
  "vault"
)

for service in "${services[@]}"; do
  echo Derrubando ambiente em: "${service}"
  (cd "${ROOT_DIR}/${service}" && docker compose down)
done

echo "Todos os ambientes foram desligados com sucesso."
