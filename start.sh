#!/bin/sh
node /app/index.js &
nginx -g "daemon off;"