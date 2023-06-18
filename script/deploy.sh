#!/bin/bash

# Hentikan container Nginx yang sedang berjalan
docker stop sakhih/super-app-node-exercise
docker stop sakhih/super-app-php-exercise

# Hapus container Nginx yang sedang berjalan
docker rm sakhih/super-app-node-exercise
docker rm sakhih/super-app-php-exercise

# Unduh image Nginx terbaru dari DockerHub
docker pull sakhih/super-app-node-exercise:latest
docker pull sakhih/super-app-php-exercise:latest
docker pull mysql:latest
# Jalankan container Nginx baru dengan nama "my-nginx-container"
docker run -d --name super-app-node -p 3000:3000 sakhih/super-app-node-exercise:latest
docker run -d --name super-app-php -p 80:80 sakhih/super-app-php-exercise:latest
docker run -d --name super-app-mysql -p 3306:3306 -e MYSQL_DATABASE=super-app -e MYSQL_ROOT_PASSWORD=password mysql:latest
