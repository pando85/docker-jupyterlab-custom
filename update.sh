#!/bin/bash
set -e

version=$(curl -s -X GET https://hub.docker.com/v2/repositories/jupyter/scipy-notebook/tags/ | \
    jq -r '.results[].name' | grep -v latest | head -n1)

sed -i "s/^FROM jupyter\/scipy-notebook:.*/FROM jupyter\/scipy-notebook:$version/g" Dockerfile
