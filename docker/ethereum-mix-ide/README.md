# Docker image of the Ethereum Mix IDE.

Version 1
https://github.com/imifos/ethereum-workspace/docker

Build image:
    sudo docker build -t "imifosmkdir " .

Create container:
    sudo docker run -it --name ethereumix -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY imifos/ethereum-mix-ide

(Re)Start container (-i optional):
    sudo docker start -i ethereumix
