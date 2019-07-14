# Laravel Dockerize
Digunakan untuk menjalankan project laravel menggunakan docker, sehingga dapat mempermudah developer tanpa perlu menginstall dan mempersiapkan environment yang akan digunakan.

## Environment

### Webapp
- [x] Apache2 (rewrite, headers)
- [x] PHP7.3/7.2/7.1/5.6 (pdo_mysql, intl, gd, zip, bz2, opcache, ldap, bcmath, mysqli, mongodb)
- [x] Composer
- [x] GNU Nano
- [x] phpMyAdmin

### Redis
- [x] Redis

### Database
- [x] MariaDB

## Password akses
- MariaDB, root: `toor`
- Redis, `toor`

## Cara penggunaan
1. Download/simpan file `docker-compose.yml` menjadi satu directory dengan project laravel
2. Tambahkan environment baru pada file `.env`
    * DOCKER_WEBAPP_PORT, dengan nilai port yang digunakan mengakses project saat dijalankan
    * DOCKER_PHP_VERSION, dengan nilai versi php yang ingin digunakan pada project
3. Build terlebih dahulu containernya dengan perintah `docker-compose up --no-start`
4. Jalankan services dengan perintah `docker-compose start`
5. Untuk menghentikan services yang berjalan gunakan perintah `docker-compose stop`
6. Terakhir, untuk membersikan container yang telah dibuild gunakan perintah `docker-compose down`

## DOT-docker script
Bagi developer yang belum terbiasa dengan docker/docker-compose dapat menggunakan script ini agar mempermudah penggunaan

### Linux/macOS
Install 
```
curl -sS https://raw.githubusercontent.com/kudaliar032/dot-dockerize-laravel/master/unix/dot-docker.sh -o dot-docker && sudo mv dot-docker /usr/local/bin && sudo chmod +x /usr/local/bin/dot-docker
```
Daftar perintah
```
dot-docker build - build all container services
dot-docker clear - stop and delete all container services
dot-docker start - start all services
dot-docker stop - stop all services without delete container
dot-docker [SERVICE] [COMMAND] - run bash command in a service
```

## Menambah environment pada service
Jika ingin menambahkan environment kedalam service ataupun ingin mengaktifkan extentsion php pada container dapat dilakukan dengan melakukan sedikit modifikasi pada file `docker-compose.yml` dan menambahkan file `Dockerfile` pada project.

### docker-compose.yml
Ubah bagian `image: blabla` menjadi `build: .`. Ubah sesuai dengan service yang ingin dimodifikasi apakah pada service webapp, database atau redis. Seperti contoh berikut
```
version: "3.0"
services:
  webapp:
    build: .
    volumes:
      - ".:/var/www/html"
    depends_on:
```

### Dockerfile
Tambahkan sebuah file bernama `Dockerfile` yang berisikan command yang akan dijalankan pada container. Command yang dimasukan dapat berupa installasi environment baru, penambahan extentsion baru atau perintah konfigurasi environment. File `Dockerfile` harus berada dalam satu directory dengan `docker-compose.yml`. Seperti contoh berikut ini
```
FROM dotlabs/apache:php7.3
RUN apt install -y libmagickwand-dev
RUN pecl install imagick && docker-php-ext-enable imagick
```

## Catatan
* Untuk menjalankan perintah docker-compose/dot-docker pastikan berada dalam directory `docker-compose.yml` berada
