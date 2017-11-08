# Docker Swarm

## Docker

### Compose

Build :   
`docker-compose build`   

Start :   
`docker-compose up -d`   

Stop :   
`docker-compose stop`   

Delete :   
`docker-compose down`   


### Swarm

Soon !   

### Applications

- HTTPD : `80/tcp` (HTTP) : Wordpress 4   
- MYSQL : `3306/tcp` (access via user `wordpress`) : Database Wordpress   
- InfluxDB : `8125/udp, 8092/udp, 8086/tcp 8083/tcp` (8086 HTTP WebAPI) : Data Monitoring   
- Chronograf : `8888/tcp` (HTTP, API + interface) : Monitoring    
- Kapacitor : `9092/tcp` (HTTP WebAPI) : Alerting   
- Minio : `9000/tcp` (HTTP, API + interface) : Logs   

### Mapping

<img src="https://img4.hostingpics.net/pics/537792dockerswarm.jpg" alt="Mapping" style="width: 500px;"/>

### Flux

<img src="https://img4.hostingpics.net/pics/410968flux.jpg" alt="Mapping" style="width: 500px;"/>

### Commands

Delete all containers (stoped, created or exited) :   
`docker rm $(docker ps -a -q)`   

Delete all containers exited :   
`docker ps -a | grep Exit | cut -d " " -f 1 | xargs docker rm`

Delete all containers just created :   
`docker ps -a | grep Created | cut -d " " -f 1 | xargs docker rm`

Delete all images :   
`docker rmi $(docker images -q)`   

Delete all volumes :   
`docker volume rm `docker volume ls -q -f dangling=true``   


## Ansible

Soon !   
