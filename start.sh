#!/bin/bash

# permissão ao script chmod +x start.sh e rodar script ./start.sh
# Comando para subir os serviços com Docker Compose
docker compose up -d --build

# Comando para ajustar permissões na pasta local php/src
sudo chmod -R 777 ./php/src

