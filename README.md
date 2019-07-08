# Laravel Dockerize
Digunakan untuk menjalankan project laravel menggunakan docker, tampa perlu melakukan installasi dan konfigurasi pada server.
</br>
### How to use
1. Download/simpan file `docker-compose.yml` menjadi satu dengan project laravel
2. Tambahkan environment pada file `.env`
    * DOCKER_WEBAPP_PORT, dengan nilai port yang digunakan mengakses project saat dijalankan
    * DOCKER_PHP_VERSION, dengan nilai versi php yang ingin digunakan pada project
3. Untuk menjalankan docker gunakan perintah `docker-compose start`
4. Untuk memberhentikan dokcer yang telah berjalan gunakan perintah `docker-compose stop`
