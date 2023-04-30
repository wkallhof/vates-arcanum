build:
	dotnet build ./src/VatesArcanum/VatesArcanum.csproj

run:
	dotnet run --project ./src/VatesArcanum/VatesArcanum.csproj

watch:
	dotnet watch run --project ./src/VatesArcanum/VatesArcanum.csproj

docker-build:
	docker build -t vates-arcanum .

docker-run:
	docker run --rm -p 7650:7650 -v "$(shell pwd)"/data:/data vates-arcanum

connect:
	ssh -i ~/.ssh/digitalOcean_id_rsa system@164.90.149.20

deploy:
	rsync -Pav --exclude-from "$(shell pwd)"/.exclude -e ssh -i ~/.ssh/digitalOcean_id_rsa "$(shell pwd)" system@164.90.149.20:~/apps/