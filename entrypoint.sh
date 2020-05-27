#!/bin/sh
# Docker entrypoint script.

mix ecto.create
mix ecto.migrate

_build/prod/rel/conference/bin/conference start