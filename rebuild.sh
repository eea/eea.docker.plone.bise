#!/bin/sh
./docker-compose -f devel-compose.yml stop plone
./docker-compose -f devel-compose.yml build plone
./docker-compose -f devel-compose.yml up -d plone
