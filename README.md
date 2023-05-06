
# Laravel app with Nginx, MySQL, and Docker Compose:

## Installation

1. Install docker and docker compose for your system.
You can download from this link.

   https://www.docker.com/


2. Make sure to install latest version of php and composer for this project.
You can download from following links:

   https://www.php.net/downloads

   https://getcomposer.org/

3. Navigate to your project directory:
```bash
  cd laravel-app-with-nginx-mysql-and-docker-compose
```
    


## Running Container

Start the Docker containers by running the following command:

```bash
  docker-compose up -d
```
Important: Make sure that docker engine is running in your system.

## Checking Container Status

Verify that the containers are running by running the following command:

```bash
  docker-compose ps
```

This should show output similar to the following:
```
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS         PORTS                    NAMES
03d9e8fe65c5   nginx:alpine   "/docker-entrypoint.…"   44 minutes ago   Up 6 seconds   0.0.0.0:8080->80/tcp     my-app-web-1
354e2ce8aad5   my-app-app     "docker-php-entrypoi…"   44 minutes ago   Up 7 seconds   0.0.0.0:9000->9000/tcp   my-app-app-1
9f2f18938c43   mysql:5.7      "docker-entrypoint.s…"   44 minutes ago   Up 7 seconds   3306/tcp, 33060/tcp      my-app-db-1

```

## Running Laravel App

Run the laravel app using following command:

```bash
  docker-compose up 
```
Navigate to your local host : http://localhost:8080/ 
where you see your laravel app running with Nginx, MySQL, and Docker Compose:




## Architecture Diagram to Setup a Laravel application with Nginx, Mysql with Docker Compose on top of kubernetes..


                                      +------------------+
                                      |  Load Balancer    |
                                      |  (e.g. Nginx)     |
                                      +--------+---------+
                                               |
                                      +--------v---------+
                                      |    Kubernetes     |
                                      |   Cluster Master  |
                                      +--------+---------+
                                               |
                              +----------------+----------------+
                              |                 |                 |
                              v                 v                 v
                      +-------+--------+  +-----+------+  +-------+--------+
                      |   Namespace    |  | Deployment |  |   Service       |
                      |     (app)      |  | (Laravel)  |  |   (Laravel)     |
                      +-------+--------+  +-----+------+  +-------+--------+
                              |                 |                 |
                              v                 v                 v
                      +-------+--------+  +-----+------+  +-------+--------+
                      |  ConfigMap     |  |  Pod     |  |  Persistent     |
                      |  (Laravel env  |  |  (Laravel |  |  Volume (MySQL) |
                      |   variables)  |  |  container) |                 |
                      +-------+--------+  +-----+------+  +-------+--------+
                              |                 |                 |
                              v                 v                 v
                      +-------+--------+  +-----+------+  +-------+--------+
                      |  Secret        |  |  Pod        |  |  Persistent    |
                      |  (MySQL creds) |  |  (MySQL  |  |  |Volume (Laravel |
                      |                |  |  container) |  |  logs)         |
                      +-------+--------+  +-----+------+  +-------+--------+

The architecture diagram above shows a Kubernetes cluster that is hosting a Laravel application with Nginx and MySQL using Docker Compose.
