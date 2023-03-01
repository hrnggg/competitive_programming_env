#!/bin/bash

echo "start code-server"
code-server \
    --auth none \
    --bind-addr 0.0.0.0:8080 \
    $HOME/contest
