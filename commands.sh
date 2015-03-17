#!/bin/bash

DKR_IMAGE=djlebersilvestre/postgres:9.4.1
DKR_PG_CONTAINER=postgres
PG_PASS=testing
PG_HOST=127.0.0.1
PG_PORT=5432

pg_setup() {
  docker run --name $DKR_PG_CONTAINER -e POSTGRES_PASSWORD=$PG_PASS -d -p $PG_HOST:$PG_PORT:$PG_PORT $DKR_IMAGE
}

pg_start() {
  pg_stop
  docker start $DKR_PG_CONTAINER
}

pg_restart() {
  pg_start
}

pg_stop() {
  docker stop $DKR_PG_CONTAINER
}

pg_cli() {
  docker run -it --link $DKR_PG_CONTAINER:$DKR_PG_CONTAINER --rm $DKR_IMAGE sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
}

alias pg-setup=pg_setup
alias pg-start=pg_start
alias pg-stop=pg_stop
alias pg-restart=pg_restart
alias pg-cli=pg_cli
