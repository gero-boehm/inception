include srcs/.env
export

# nginx:
# 	docker build --build-arg USER=$(USER) -t nginx srcs/requirements/nginx
# 	docker run -itp 443:443 nginx

# mariadb:
# 	$(eval BUILD_ARGS=$(shell cat srcs/.env | sed 's/#.*//g' | xargs -I {} echo --build-arg {}))
# 	docker build $(BUILD_ARGS) -t mariadb srcs/requirements/mariadb
# 	docker run -itp 3306:3306 mariadb

all:
	mkdir -p /home/gbohm/data/mariadb
	mkdir -p /home/gbohm/data/wordpress
	docker-compose -f srcs/docker-compose.yml -p inception up --build -d --remove-orphans

clean:
	docker-compose -f srcs/docker-compose.yml -p inception down --rmi all --volumes --remove-orphans

prune: clean
	docker system prune -af
	rm -rf /home/gbohm/data/mariadb
	rm -rf /home/gbohm/data/wordpress

re: clean all

.PHONY: all clean re