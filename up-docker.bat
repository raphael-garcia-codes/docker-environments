@echo off
setlocal enabledelayedexpansion

set "ROOT_DIR=%~dp0"
set "ROOT_DIR=%ROOT_DIR:~0,-1%"
set "SERVICES=grafana kafka kafka-ui postgres pgadmin rabbitmq redis redisinsight vault wiremock wiremock-gui sonarqube jaeger omniroute"

if "%~1"=="" (
  set "SELECTED_SERVICES=%SERVICES%"
) else (
  set "SELECTED_SERVICES="
  for %%A in (%*) do (
    set "SERVICE=%%~A"
    if "!SERVICE:~0,1!"=="-" set "SERVICE=!SERVICE:~1!"
    if not exist "%ROOT_DIR%\!SERVICE!\docker-compose.yml" (
      echo Servico invalido: !SERVICE!
      echo Servicos disponiveis: %SERVICES%
      exit /b 1
    )
    set "SELECTED_SERVICES=!SELECTED_SERVICES! !SERVICE!"
  )
)

for %%S in (%SELECTED_SERVICES%) do (
  echo Subindo ambiente em: %%S
  pushd "%ROOT_DIR%\%%S"
  docker compose up -d
  popd
)

echo Todos os ambientes foram iniciados com sucesso.
endlocal
