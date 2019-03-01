SHELL := /bin/bash
CLOUDS ?= .

pre:
	mkdir -p $(CLOUDS)

all: pre digitalocean ec2


# DigitalOcean

digitalocean: pre digitalocean-test digitalocean-build

digitalocean-test:
	doctl compute region list

digitalocean-build:
	doctl compute region list -o json > /tmp/.digitalocean.json && \
		mv /tmp/.digitalocean.json $(CLOUDS)/digitalocean.json


# Amazon EC2

ec2: pre ec2-test ec2-build

ec2-test:
	echo ec2-test

ec2-build:
	echo ec2-build
