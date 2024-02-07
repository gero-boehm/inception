include srcs/.env
export

nginx:
	docker build --build-arg USER=$(USER) -t nginx srcs/requirements/nginx
	docker run -itp 443:443 nginx

mariadb:
	$(eval BUILD_ARGS=$(shell cat srcs/.env | sed 's/#.*//g' | xargs -I {} echo --build-arg {}))
	docker build $(BUILD_ARGS) -t mariadb srcs/requirements/mariadb
	docker run -itp 3306:3306 mariadb

