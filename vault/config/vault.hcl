ui = true

disable_mlock = true

api_addr = "http://0.0.0.0:8200"

storage "file" {
  path = "/file"
}

listener "tcp" {

  address = "0.0.0.0:8200"

  tls_disable = 1
}

log_level = "INFO"

log_file = "/logs/vault.log"