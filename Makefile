#---------------- Requirements ----------------
freeze:
	pip freeze > app/requirements.txt
	pip freeze > client/requirements.txt

deps:
	pip install -r app/requirements.txt
	pip install -r client/requirements.txt

#---------------- app ----------------
bot:
	python app/userAgent/UserBot.py

server:
	cd app/ && gunicorn --bind 0.0.0.0:5544 app:app

#---------------- Docker ----------------
build:
	sudo docker-compose -f docker-compose.dev.yml build

docker_up:
	sudo docker-compose -f docker-compose.dev.yml up

docker_upd:
	sudo docker-compose -f docker-compose.dev.yml up -d

docker_stop:
	sudo docker stop $(sudo docker ps -a -q)

docker_rm:
	sudo docker rm $(sudo docker ps -a -q)

#---------------- Clean cache ----------------
clean:
	rm -rf app/__pycache__ && rm -rf client/__pycache__

#---------------- Git ----------------
gadd:
	git add .

gcom: # git commit -am "{com}" | com=<your comment>
	git commit -am "$(com)"

gpush_dev:
	git push origin dev

gpull:
	git pull




