#!/usr/bin/env bash

getent group docker || groupadd -r docker
usermod -a -G docker jappe
