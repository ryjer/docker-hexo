#!/bin/sh
set -e

if [ "$1" = 'install' ]; then
    set -- npm install
elif [ "$1" = 'g' ] || [ "$1" = 'generate' ]; then
    set -- hexo d
elif [ "$1" = 's' ] || [ "$1" = 'server' ]; then
    set -- hexo s -p 4000
else
    set -- "$@" 
fi

exec "$@"
