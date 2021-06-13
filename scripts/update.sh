#!/bin/bash

compose() {
	podman-compose "$@" || docker-compose "$@"
}

./scripts/get_organia_repos.sh
compose build
compose down -t 1
compose up -d
if [ "$ENV" != 'prod' ]; then
	FORCE_LOGIN=1 compose run --rm -p 9000:10080 -d backend
fi
compose logs -f
