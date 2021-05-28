#!/bin/bash

rsync -auP "$(realpath .)/" /opt/organia-infra-dev
rsync -auP "$(realpath .)/" /opt/organia-infra-prod
rsync -auP "$(realpath systemd)" /usr/local/lib
