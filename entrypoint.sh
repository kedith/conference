#!/bin/sh
# Docker entrypoint script.

_build/prod/rel/conference/bin/conference eval Conference.Release.migrate

_build/prod/rel/conference/bin/conference start