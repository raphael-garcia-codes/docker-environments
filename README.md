# Customer Docker

> **Observação:** para usar este projeto, é necessário ter o Docker instalado na sua máquina. Se você ainda não tiver, faça o download e siga a instalação oficial pelo site: https://www.docker.com/get-started/

Este repositório organiza serviços Docker em pastas separadas, facilitando subir e derrubar os ambientes de forma padronizada.

## Estrutura do projeto

- `postgres/`
- `rabbitmq/`
- `redis/`
- `vault/`
- `up-docker.sh`
- `up-docker.bat`
- `down-docker.sh`
- `down-docker.bat`

## Scripts disponíveis

### `up-docker.sh`

Script para Linux e macOS.

Executa, nesta ordem:

1. `docker compose up -d` dentro da pasta `postgres`
2. `docker compose up -d` dentro da pasta `rabbitmq`
3. `docker compose up -d` dentro da pasta `redis`
4. `docker compose up -d` dentro da pasta `vault`

### `up-docker.bat`

Script para Windows.

Executa a mesma rotina do script Linux/macOS, subindo os serviços nas pastas:

1. `postgres`
2. `rabbitmq`
3. `redis`
4. `vault`

### `down-docker.sh`

Script para Linux e macOS.

Executa, nesta ordem:

1. `docker compose down` dentro da pasta `postgres`
2. `docker compose down` dentro da pasta `rabbitmq`
3. `docker compose down` dentro da pasta `redis`
4. `docker compose down` dentro da pasta `vault`

### `down-docker.bat`

Script para Windows.

Executa a mesma rotina do script Linux/macOS, desligando os serviços nas pastas:

1. `postgres`
2. `rabbitmq`
3. `redis`
4. `vault`

## Como executar

### Linux e macOS

1. Dê permissão de execução, se necessário:

```bash
chmod +x up-docker.sh down-docker.sh
```

2. Suba os ambientes:

```bash
./up-docker.sh
```

3. Derrube os ambientes:

```bash
./down-docker.sh
```

### Windows

1. Abra o Prompt de Comando ou PowerShell na raiz do projeto.
2. Execute o script de subida:

```bat
up-docker.bat
```

3. Execute o script de desligamento:

```bat
down-docker.bat
```

## Serviços disponíveis

- PostgreSQL
- RabbitMQ
- Redis
- Vault

## Notas

- Cada pasta contém seu próprio `docker-compose.yml`.
- Os scripts assumem que você está executando a partir da raiz deste repositório.
