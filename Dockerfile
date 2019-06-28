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

CMD /bin/bash
