#!/bin/sh

tee docker-compose.yml  << EOF
# https://docs.docker.com/compose/compose-file/compose-file-v2/

version: '2.1'
services:
  go:
    image: golang:1.8.1-alpine
    entrypoint: sh
    volumes:
      - ./src/:/go/src/

  web:
    build: .
    volumes:
      - .:/some_folder_inside_containder
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  
  redis:
    image: redis
  
  db:
    image: redis
    healthcheck:
      test: "exit 0"
  
  php:
    image: php
    entrypoint:
    - php
    - -d
    - zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
    - -d
    - memory_limit=-1
    - vendor/bin/phpunit
EOF
