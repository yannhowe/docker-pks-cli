FROM ubuntu:18.04
MAINTAINER Kwan Yann Howe (yannhowe@gmail.com)
# Based on https://github.com/jhunt/containers-boshrelease/blob/master/jumpbox/Dockerfile

ARG kubectl_version=1.15.5
ARG docker_compose_version=1.25.4
ARG pks_version=1.6.1
ARG helm_version=3.1.1
ARG velero_version=1.2.0

COPY ./pks_cli/pks-linux-amd64-1.6.1 /usr/local/bin/pks
RUN apt-get update \
&& apt-get install -y \
     gnupg \
     curl wget \
     git \
     tmux tmate screen \
     tree file \
     vim \
     bzip2 zip unzip \
     lsof \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN  echo "Installing 'kubectl' v${kubectl_version}" \
&&   curl -sLo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${kubectl_version}/bin/linux/amd64/kubectl \
&&   chmod 0755 /usr/bin/kubectl \
&&   /usr/bin/kubectl version --client \
&& echo "Installing 'docker-compose' v${docker_compose_version}" \
&&   curl -L https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
&&   chmod +x /usr/local/bin/docker-compose \
&&   /usr/local/bin/docker-compose --version \
&& echo "Installing 'helm' v${helm_version}" \
&&   wget https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz \
&&   tar -zxvf helm-v${helm_version}-linux-amd64.tar.gz \
&&   chmod 0755 ./linux-amd64/helm \
&&   mv ./linux-amd64/helm /usr/bin/helm \
&&   /usr/bin/helm \
&& echo "Installing 'velero' v${velero_version}" \
&&   wget https://github.com/vmware-tanzu/velero/releases/download/v${velero_version}/velero-v${velero_version}-linux-amd64.tar.gz \
&&   tar -zxvf velero-v${velero_version}-linux-amd64.tar.gz \
&&   chmod 0755 ./velero-v${velero_version}-linux-amd64/velero \
&&   mv ./velero-v${velero_version}-linux-amd64/velero /usr/bin/velero \
&&   /usr/bin/velero
 
CMD ["shell"]