#!/bin/bash

compose() {
	podman-compose "$@" || docker-compose "$@"
}

compose down -t 1
./scripts/get_organia_repos.sh
compose up --build
