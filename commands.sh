#!/bin/bash

DKR_IMAGE=djlebersilvestre/postgres:9.4.1
DKR_PG_CONTAINER=postgres
PG_PASS=testing
PG_HOST=127.0.0.1
PG_PORT=5432

pg-setup() {
  docker run --name $DKR_PG_CONTAINER -e POSTGRES_PASSWORD=$PG_PASS -d -p $PG_HOST:$PG_PORT:$PG_PORT $DKR_IMAGE
}

pg-start() {
  pg-stop
  docker start $DKR_PG_CONTAINER
}

pg-restart() {
  pg-start
}

pg-stop() {
  docker stop $DKR_PG_CONTAINER
}

pg-cli() {
  docker run -it --link $DKR_PG_CONTAINER:$DKR_PG_CONTAINER --rm $DKR_IMAGE sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
}

alias pg-setup=pg-setup
alias pg-start=pg-start
alias pg-stop=pg-stop
alias pg-restart=pg-restart
alias pg-cli=pg-cli
