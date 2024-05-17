基于dnmp应用，符合自己开发场景的更新
## 1.php
默认构建两个php8.1环境，一个php7.4环境，包含两个未启用php83,php84版本
```angular2html
配置的环境变量env中基本已包含开发hyerpf应用到的扩展
```
## 2.nginx
nginx默认配置php74
```
修改此处的php变量即可
        location ~ [^/]\.php(/|$) {
        fastcgi_pass   php:9000;
        include        fastcgi-php.conf;
        include        fastcgi_params;
```
没了