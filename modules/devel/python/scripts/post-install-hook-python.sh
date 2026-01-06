#!/usr/bin/env bash

if [ -f /usr/bin/uv ]; then
    su - jappe -c 'uv tool install --editable /home/jappe/Repositories/bt-auto-connect'
    su - jappe -c 'uv tool install --editable /home/jappe/Repositories/idle-inhibitor'
    su - jappe -c 'uv tool update-shell'
fi

