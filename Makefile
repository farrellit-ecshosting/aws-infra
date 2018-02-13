
run: image
	docker run --rm -it -v "`pwd`:/code" -v "`ls -d ~`/.aws":/root/.aws:ro ecs-deploy

image:
	docker build -t ecs-deploy -f Dockerfile.deploy .
