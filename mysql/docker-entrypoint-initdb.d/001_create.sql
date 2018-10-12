CREATE DATABASE kimai;

CREATE USER 'kimai'@'%' IDENTIFIED BY 'kimai';
GRANT ALL PRIVILEGES ON kimai.* TO 'kimai'@'%';
