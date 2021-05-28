#!/bin/bash

[ -f ./.env ] && source ./.env

set -e

orga="${3:-$ORGA}"
repo="$1"
out="$2"

get_tag() {
	curl -f "https://api.github.com/repos/$orga/$repo/releases" -u "$GH_USER:$GH_TOKEN" \
	| jq '.[0].tag_name' --raw-output
}

rm -rf "$out"

if [ "$ENV" == 'prod' ]; then
	tag="$(get_tag)"
	if [ "$tag" == 'null' ]; then
		echo Could not find release tag in repo "$orga/$repo"
		exit 1
	fi
	git clone "git@github.com:$orga/$repo" -b "$tag" "$out"
else
	git clone "git@github.com:$orga/$repo" "$out"
fi
