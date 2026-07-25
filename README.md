# docker-environments

> **Observação:** é necessário ter o Docker instalado. Consulte a instalação oficial em <https://www.docker.com/get-started/>.

Este repositório organiza ambientes Docker em pastas separadas, facilitando subir e derrubar os serviços de forma padronizada.

## Estrutura do projeto

- `grafana/`
- `kafka/`
- `kafka-ui/`
- `postgres/`
- `pgadmin/`
- `rabbitmq/`
- `redis/`
- `redisinsight/`
- `vault/`
- `up-docker.sh` e `up-docker.bat`
- `down-docker.sh` e `down-docker.bat`

Cada pasta de serviço contém seu próprio `docker-compose.yml`.

## Imagens Docker

| Serviço | Imagem |
| --- | --- |
| Grafana | `grafana/grafana-oss:latest` |
| Kafka | `apache/kafka:4.1.0` |
| Kafka UI | `provectuslabs/kafka-ui:latest` |
| PostgreSQL | `postgres:16-alpine` |
| pgAdmin | `dpage/pgadmin4:9` |
| RabbitMQ | `rabbitmq:4-management` |
| Redis | `redis:8-alpine` |
| RedisInsight | `redis/redisinsight:latest` |
| Vault | `hashicorp/vault:1.20` |

## Scripts disponíveis

Os scripts `up-docker.sh` e `up-docker.bat` sobem todos os ambientes. Os scripts `down-docker.sh` e `down-docker.bat` derrubam todos os ambientes.

### Linux e macOS

```bash
chmod +x up-docker.sh down-docker.sh
./up-docker.sh
./down-docker.sh
```

### Windows

```bat
up-docker.bat
down-docker.bat
```

## URLs e portas dos serviços

As URLs abaixo ficam disponíveis depois que os ambientes forem iniciados. Serviços sem interface web devem ser acessados por seus respectivos clientes ou protocolos.

| Serviço | URL ou endpoint |
| --- | --- |
| Grafana | <http://localhost:13000/> |
| Kafka | `localhost:9092` |
| Kafka UI | <http://localhost:18080/> |
| PostgreSQL | `localhost:5432` |
| pgAdmin | <http://localhost:5050/> |
| RabbitMQ | <http://localhost:15672/#/> |
| RabbitMQ (AMQP) | `localhost:5672` |
| Redis | `localhost:6379` |
| RedisInsight | <http://localhost:5540/> |
| Vault | <http://localhost:8200/> |

## Credenciais padrão

- Grafana: usuário `admin`, senha `Admin@123`
- pgAdmin: e-mail `admin@admin.com`, senha `Admin@123`
- RabbitMQ: usuário `rabbitmq`, senha `rabbitmq`
- PostgreSQL: usuário `postgres`, senha `postgres`, banco `postgres_db`

> Altere as credenciais antes de usar estes ambientes em produção.
