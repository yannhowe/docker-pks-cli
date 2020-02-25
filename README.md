# PKS Cli Dockerized
Dockerized the PKS CLI, based on https://github.com/jhunt/containers-boshrelease/blob/master/jumpbox/Dockerfile

## Usage
Run CLI from inside container
```
docker run yannhowe/docker-pks-cli pks
docker run yannhowe/docker-pks-cli helm
docker run yannhowe/docker-pks-cli kubectl
docker run yannhowe/docker-pks-cli docker-compose
```