# Laravel Dockerize
Digunakan untuk menjalankan project laravel menggunakan docker, tampa perlu melakukan installasi dan konfigurasi pada server.

### Stacks ###
- [x] Apache2
- [x] PHP7.3/7.2/7.1 dan modul
- [x] Redis/Latest
- [x] MariaDB/Latest
- [x] Composer

### XXX ###
- MariaDB root password, `toor`
- Redis default password, `toor`

### Cara Penggunaan ###
1. Download/simpan file `docker-compose.yml` menjadi satu dengan project laravel
2. Tambahkan environment pada file `.env`
    * DOCKER_WEBAPP_PORT, dengan nilai port yang digunakan mengakses project saat dijalankan
    * DOCKER_PHP_VERSION, dengan nilai versi php yang ingin digunakan pada project
3. Untuk menjalankan docker gunakan perintah `docker-compose start`
4. Untuk menghentikan dokcer yang telah berjalan gunakan perintah `docker-compose stop`

### Mengakses Database SQL ###
1. Masukan perintah `docker-compose exec mariadb /usr/bin/mysql -p`
2. Masukan password dari user root

### Note ###
Untuk menjalankan perintah docker-compose pastikan berada dalam directory `docker-compose.yml` berada
