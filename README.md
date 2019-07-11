# Laravel Dockerize
Digunakan untuk menjalankan project laravel menggunakan docker, sehingga dapat mempermudah developer tanpa perlu menginstall dan mempersiapkan environment yang akan digunakan.

### Stacks: ###
- [x] Apache2 (rewrite, headers)
- [x] PHP7.3/7.2/7.1/5.6 (pdo_mysql, intl, gd, zip, bz2, opcache, ldap, bcmath, mysqli, mongodb)
- [x] Redis
- [x] MariaDB
- [x] Composer
- [x] GNU Nano
- [x] phpMyAdmin

### Password akses: ###
- MariaDB, root: `toor`
- Redis, `toor`

### Cara penggunaan: ###
1. Download/simpan file `docker-compose.yml` menjadi satu directory dengan project laravel
2. Tambahkan environment baru pada file `.env`
    * DOCKER_WEBAPP_PORT, dengan nilai port yang digunakan mengakses project saat dijalankan
    * DOCKER_PHP_VERSION, dengan nilai versi php yang ingin digunakan pada project
3. Build terlebih dahulu containernya dengan perintah `docker-compose up --no-start`
4. Kemudian, jalankan services dengan perintah `docker-compose start`
5. Untuk menghentikan services yang berjalan gunakan perintah `docker-compose stop`
6. Terakhir, untuk membersikan container yang telah dibuild gunakan perintah `docker-compose down`

### Catatan: ###
* Untuk menjalankan perintah docker-compose pastikan berada dalam directory `docker-compose.yml` berada
