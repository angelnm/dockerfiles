#!/bin/bash

docker container run --rm --gpus all \
	-v "$(pwd)"/config.py:/opt/nmt-keras/config.py \
	-v "$(pwd)"/datasets:/opt/nmt-keras/datasets \
	-v "$(pwd)"/trained_models:/opt/nmt-keras/trained_models \
	nmt-keras bash -c 'python3 main.py'
