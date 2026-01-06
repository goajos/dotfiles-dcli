#!/usr/bin/env bash

if [-f /usr/bin/uv ]; then
   uv tool install --editable /home/jappe/Repositories/bt-auto-connect
   uv tool install --editable /home/jappe/Repositories/idle-inhibitor
fi
