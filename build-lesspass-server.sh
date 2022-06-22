#!/bin/bash
#sed -i '/^EXPOSE 8000/'d containers/backend/Dockerfile
sed -i 's/COMPOSE_PROJECT_NAME=lesspass/COMPOSE_PROJECT_NAME=lesspass-qxzg/g'  containers/.env
sed -i 's/quay.io/'${CONTAINER_DOMAIN}'/g' containers/docker-compose.yml
sed -i 's/\/lesspass\//'${CONTAINER_PATH}'/g' containers/docker-compose.yml
echo "">> packages/lesspass-site/Dockerfile;echo "RUN sed -i 's/https:\/\/api.lesspass.com/https:\/\/qxzg.xyz/g' /usr/share/nginx/html/lesspass.min.js" >> packages/lesspass-site/Dockerfile
sed -i 's/EXPOSE 8000/EXPOSE 11004/g' containers/backend/Dockerfile
sed -i 's/EXPOSE 80/EXPOSE 11003/g' packages/lesspass-site/Dockerfile
sed -i 's/\"0.0.0.0:8000\"/\"0.0.0.0:11004\"/g' containers/backend/Dockerfile
sed -i 's/listen       80;/listen       11003;/g' packages/lesspass-site/nginx.conf

sed -i 's/\"backend\", \".lesspass.com\", //g' containers/backend/lesspass/settings.py
sed -i 's/lesspass.local/127.0.0.1/g' containers/backend/lesspass/settings.py
#sed -i 's/days=7/days=14/g' containers/backend/lesspass/settings.py