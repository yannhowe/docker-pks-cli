# PKS Cli Dockerized
Dockerized the PKS CLI, based on https://github.com/jhunt/containers-boshrelease/blob/master/jumpbox/Dockerfile

Then I realised I should probbaly just add all the CLIs I need and also use it as the base image for my Gitlab CI/CD image.

## Usage
Run CLI from inside container
```
docker run yannhowe/docker-pks-cli pks
docker run yannhowe/docker-pks-cli helm
docker run yannhowe/docker-pks-cli kubectl
docker run yannhowe/docker-pks-cli docker-compose
docker run yannhowe/docker-pks-cli velero
```