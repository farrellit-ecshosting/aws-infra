

run: image
	docker run --rm -it -v "`pwd`:/code" --entrypoint ls ecs-deploy -la

image:
	docker build -t ecs-deploy -f Dockerfile.deploy .
