SHELL := /bin/bash
CLOUDS ?= .

pre:
	mkdir -p $(CLOUDS) || true

all: pre digitalocean ec2 lightsail


# DigitalOcean

digitalocean: pre digitalocean-test digitalocean-build

digitalocean-test:
	doctl compute region list

digitalocean-build:
	doctl compute region list -o json > $(CLOUDS)/digitalocean.json


# Amazon EC2

ec2: pre ec2-test ec2-build

ec2-test:
	aws ec2 describe-regions

ec2-build:
	aws ec2 describe-regions --output json > $(CLOUDS)/ec2.json

# Amazon Lightsail

lightsail: pre lightsail-test lightsail-build

lightsail-test:
	aws lightsail get-regions

lightsail-build:
	aws lightsail get-regions --output json > $(CLOUDS)/lightsail.json
