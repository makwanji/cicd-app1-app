#!/bin/bash
docker run -d -p 8000:80 --name cicd-app1-app \
  -e DB_CONNECTION=mysql -e DB_HOST=cicd-app1-db -e DB_PORT=3306 \
  -e DB_DATABASE=music -e DB_USERNAME=root -e DB_PASSWORD="supersecret" \
  rts-app:1.0
