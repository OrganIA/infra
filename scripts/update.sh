#!/bin/bash

compose() {
	podman-compose "$@" || docker-compose "$@"
}

./scripts/get_organia_repos.sh
compose build
compose down -t 1
compose up -d
compose logs -f
