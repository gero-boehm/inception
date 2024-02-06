include srcs/.env
export

nginx:
	docker build --build-arg USER=$(USER) -t nginx srcs/requirements/nginx
	docker run -itp 443:443 nginx

mariadb:
	docker build -t mariadb srcs/requirements/mariadb
	docker run -itp 3306:3306 mariadb

