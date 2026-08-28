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
  "omniroute"
  "wiremock"
  "wiremock-gui"
  "sonarqube"
  "jaeger"
)

if (($# == 0)); then
  selected_services=("${services[@]}")
else
  selected_services=()
  for argument in "$@"; do
    service="${argument#-}"
    if [[ ! -f "${ROOT_DIR}/${service}/docker-compose.yml" ]]; then
      echo "Serviço inválido: ${service}" >&2
      echo "Serviços disponíveis: ${services[*]}" >&2
      exit 1
    fi
    selected_services+=("${service}")
  done
fi

for service in "${selected_services[@]}"; do
  echo "Subindo ambiente em: ${service}"
  (cd "${ROOT_DIR}/${service}" && docker compose up -d)
done

echo "Todos os ambientes foram iniciados com sucesso."
