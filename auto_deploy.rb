#!/usr/bin/env ruby

p 'build docker_app and docker_nginx'
`docker build . -t johnsonzhan121/docker_app`
`docker build docker/nginx/. -t johnsonzhan121/docker_nginx`

p 'push docker_app and docker_nginx'
`docker push johnsonzhan121/docker_app`
`docker push johnsonzhan121/docker_nginx`

p 'update docker-compose.yml'
`scp docker-compose.yml root@178.128.214.6:/home/docker`

p 'pull Image from Docker Hub'
`ssh root@178.128.214.6  'docker pull johnsonzhan121/docker_app'`
`ssh root@178.128.214.6  'docker pull johnsonzhan121/docker_nginx'`

p 'remote docker-compose up'
`ssh root@178.128.214.6  'cd /home/docker && docker-compose up'`
