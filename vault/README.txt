Subir
docker compose up -d
Interface Web
http://localhost:8200

Você verá a tela do Vault.

Primeiro acesso

O Vault inicia selado (sealed) por padrão.

Execute:

docker exec -it vault vault operator init

Você receberá algo parecido com:

Unseal Key 1: xxxxxxxxxxxxxxxxxxxxxxxxx

Unseal Key 2: xxxxxxxxxxxxxxxxxxxxxxxxx

Unseal Key 3: xxxxxxxxxxxxxxxxxxxxxxxxx

Initial Root Token: hvs.xxxxxxxxxxxxxxxxx

⚠️ Guarde essas informações com muito cuidado, pois elas permitem desbloquear e administrar o Vault.

Desbloquear

Após a inicialização:

docker exec -it vault vault operator unseal

Cole a primeira chave.

Repita com a segunda:

docker exec -it vault vault operator unseal

Cole a segunda chave.

Repita com a terceira.

Depois disso:

http://localhost:8200

Já será possível fazer login usando o Root Token.

Consultar status
docker exec vault vault status

Você deverá ver algo semelhante a:

Initialized  true

Sealed       false

Version      1.20.x
Persistência

Todos os segredos ficam armazenados em:

vault/file/

Assim, mesmo executando:

docker compose down

ou removendo o container:

docker compose up -d

os dados continuarão disponíveis, desde que o diretório vault/file seja preservado.