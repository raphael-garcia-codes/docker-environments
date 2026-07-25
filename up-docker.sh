#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

services=(
  "grafana"
  "kafka"
  "kafka-ui"
  "postgres"
  "pgadmin"
  "rabbitmq"
  "redis"
  "redisinsight"
  "vault"
)

for service in "${services[@]}"; do
  echo "Subindo ambiente em: ${service}"
  (cd "${ROOT_DIR}/${service}" && docker compose up -d)
done

echo "Todos os ambientes foram iniciados com sucesso."
