main:
	docker volume inspect wphttpvol || docker volume create wphttpvol
	docker volume inspect wpsqlvol || docker volume create wpsqlvol
	docker network inspect wpnet >/dev/null || docker network create wpnet
	docker inspect wpmysql  >/dev/null || \
		docker run --mount type=volume,src=wpsqlvol,dst=/var/lib/mysql -d \
		-e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=dk4rj1T -e MYSQL_ROOT_PASSWORD=`openssl rand -hex 48` \
		--rm --network wpnet  --name wpmysql mysql
	docker inspect wp >/dev/null || \
		docker run -e WORDPRESS_DB_HOST="`docker inspect --format='{{.NetworkSettings.Networks.wpnet.IPAddress}}' wpmysql`" \
		-e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=dk4rj1T -e WORDPRESS_DB_NAME=wordpress \
		--mount type=volume,src=wphttpvol,dst=/var/www/html --rm -d --name wp --network wpnet -p 8001:80 wordpress 
