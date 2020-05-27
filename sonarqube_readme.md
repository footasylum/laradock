docker-compose exec --user=root postgres bash
source docker-entrypoint-initdb.d/init_sonarqube_db.sh
