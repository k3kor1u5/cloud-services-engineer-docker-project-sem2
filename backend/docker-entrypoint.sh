#!/bin/sh
set -e

if [ -n "$JWT_SECRET" ]; then
    echo "JWT_SECRET provided via environment variable."
else
    if [ -n "$JWT_SECRET_FILE" ] && [ -f "$JWT_SECRET_FILE" ]; then
        export JWT_SECRET=$(cat "$JWT_SECRET_FILE")
        echo "JWT_SECRET loaded from Docker secret file."
    else
        echo "WARNING: JWT_SECRET is not set! Authentication will fail." >&2
    fi
fi

exec "$@"