#!/usr/bin/env bash

if [ -f /usr/bin/uv ]; then
    su - jappe -c 'git config --global merge.tool nvimdiff'
    su - jappe -c 'git config --global diff.tool nvimdiff'
fi

