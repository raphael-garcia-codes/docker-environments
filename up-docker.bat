@echo off
setlocal enabledelayedexpansion

set "ROOT_DIR=%~dp0"
set "ROOT_DIR=%ROOT_DIR:~0,-1%"

for %%S in (postgres rabbitmq redis vault) do (
  echo Subindo ambiente em: %%S
  pushd "%ROOT_DIR%\%%S"
  docker compose up -d
  popd
)

echo Todos os ambientes foram iniciados com sucesso.
endlocal
