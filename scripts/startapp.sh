#!/bin/bash
docker run -d -p 8000:8000 --name cicd-app1-app -e DB_HOST=cicd-app1-db rts-app:1.0
