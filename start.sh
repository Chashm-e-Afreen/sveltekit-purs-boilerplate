#!/bin/sh
cd /app
pnpm install

# Start Spago watcher in background
spago build
watchexec -r -e purs,yaml,js,ts -- spago build &

pnpm dev --host


