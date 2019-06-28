FROM ubuntu:18.04

RUN apt-get update && apt-get -y install sudo


RUN useradd -m docker && \
  echo "docker:docker" | chpasswd && \
  adduser docker sudo

WORKDIR /home/docker/.files
COPY ./script/install-dependencies ./script/
RUN ./script/install-dependencies

COPY . ./
RUN chown -R docker /home/docker
USER docker

RUN ansible-playbook computer.yml --extra-vars "ansible_sudo_pass=docker"

CMD /bin/bash
