# Docker Swarm

## Docker

### Compose

Build :   
`docker-compose build`   

Start :   
`docker-compose up -d`   

Status :   
`docker-compose ps`

Stop :   
`docker-compose stop`   

Delete :   
`docker-compose down`   


### Swarm

Launch :   
`docker stack deploy -c docker-compose-swar.yml hive`   

Status :   
`docker service ls`

Delete :   
`docker stack rm hive`   

### Services

- Registry `5000/tcp` (HTTP API) : Private Registry Docker,   
- HTTPD `80/tcp` (HTTP) : Wordpress 4,   
- MySQL `3306/tcp` (access via user `wordpress`) : MariaDB Database Wordpress,   
- Telegraf : Transmitter of Docker metrics & machine (InfluxData),   
- InfluxDB `8125/udp, 8092/udp, 8086/tcp 8083/tcp` (HTTP WebAPI + Binaries interface) : Database Monitoring (InfluxData),   
- Chronograf `8888/tcp` (HTTP API + interface) : Monitoring Interface (InfluxData),   
- Kapacitor `9092/tcp` (HTTP API) : Alerting (InfluxData),   
- ElasticSearch : `9200/tcp 9300/tcp` (HTTP API + Binary interface) : Indexing infrastructure logs,   
- Fluentd `24224/tcp, 24224/udp` : Unified Logging Layer,
- Kibana `5601/tcp` (HTTP interface) : Kibana analytics and search dashboard for Elasticsearch,
- Minio `9000/tcp` (WebRPC Golang + interface) : Logs Storage (type AWS S3).   

### Mapping

<img src="https://raw.githubusercontent.com/perriea/docker-swarm/swarm/draw.io/docker-swarm.jpg" alt="Mapping" style="width: 500px;"/>

### Flux

<img src="https://raw.githubusercontent.com/perriea/docker-swarm/swarm/draw.io/flux.jpg" alt="Mapping" style="width: 500px;"/>

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
