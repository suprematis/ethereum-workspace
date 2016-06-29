# Docker image of the Ethereum Mix IDE.
#
# Version 1
# https://github.com/imifos/ethereum-workspace
# 
# Build image: 
#     sudo docker build -t "imifos/ethererumix " .
# Create container: 
#     sudo docker run -it --name ethereumix -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY imifos/ethereum-mix-ide
# (Re)Start container (-i optional): 
#     sudo docker start -i ethereumix
#
#
 
FROM ubuntu 
MAINTAINER Tasha CARL <imifos@mm.st>

# 'software-properties-common' is required for add-apt-repository, 
# which we want to use to make us independent from the UBUNTU version 
# when adding external repositories. And while at it, we add sudo and
# firefox so we can fully develop inside our container.
RUN apt-get update 
RUN apt-get -y install software-properties-common \
    && apt-get install -y sudo \
    && apt-get install -y firefox

# Install Mix IDE
RUN add-apt-repository ppa:ethereum/ethereum-qt \
    && add-apt-repository ppa:ethereum/ethereum 
RUN apt-get update
RUN apt-get -y install mix-ide

# Creates an user account under which we can start an X11 session
# via the mounted X11 IPC socket from the host. This is required 
# since it's not possible (easy) to run an X session as root. 
#
# Making the user sudoer and part of the root group will allow us
# to customise containers on the fly later-on: 
# $> sudo docker exec -ti ethereumix /bin/sh
#
ENV HOME /home/mix
RUN useradd --create-home --home-dir $HOME mix \
    && chown -R mix:mix $HOME \
    && usermod -a -G audio,video mix \
    && adduser mix root \
    && echo "mix ALL=(ALL) NOPASSWD: ALL \n" >> /etc/sudoers

WORKDIR $HOME 
USER mix 

ENTRYPOINT mix-ide 

