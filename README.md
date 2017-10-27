# ansible-swarm

## Docker

Fonctionne totalement !   
   
Demarrer le compose :   
`docker-compose up -d`

Mettre off l'infra :   
`docker-compose down`

Supprimer tous les volumes Docker :   
`docker volume rm `docker volume ls -q -f dangling=true`
