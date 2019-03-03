---
layout: post
title: X(GUI) Forwarding on Docker Containers with Focus on GNU-Radio
---

It's been some time since I am flown to heaven with Docker. No more critical break to my OS during experimentation with OSS(Open-Source-Software) repos. No more tinkering on how to fix the broken linux, which actually transformed me from n00b to expert of broken linux architecture. But still if you want to start a gui in docker, its not so straight forward and the official [procedure](https://github.com/carlesfernandez/docker-pybombs-gnsssdr "Docker RF") on [GNSS website](https://gnss-sdr.org/) doesn't work because of the non-inclusion of x-server permission command. So, because of these motivation, I am documenting my own approach here with focussing on my love [GNU-Radio](https://www.gnuradio.org/"GNU-Radio").

## How Docker solve these problem:
The description on the [Docker](https://www.docker.com/ "Docker") reads:
> Docker allows you to package an application with all of its dependencies into a standardized unit for software development.

We will set up docker with all the dependencies of GNSS & GNU-Radio and X forward the GUI from docker to host computer. Write the ```dockerfile``` as below

```dockerfile
FROM ubuntu:18.04
LABEL purpose="GNUgui"

#ENTRYPOINT [ "executable" ]

WORKDIR /apps

RUN apt update
RUN apt upgrade -y
RUN apt install  -qqy x11-apps
RUN echo '9' | apt install -y gnss-sdr
RUN apt install gnuradio
```

After ```cd``` into the dockerfile directory, run the following command
``` 
docker build -t 'nameOfImage' .
```

Now, run the built image while forwarding the gui of docker to host with the following command.
```
docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY gnu/gui /bin/bash
```

But still, to be able to X forward, we have to give the permission to ```xhost```
```
xhost +local:root # for the lazy and reckless
```

This comes with the vulnerabilities. If you are concerned, either run 
```
xhost -local:root
## or
xhost -
```
after you are done with your work, this will return the access control like before.

Now, we have started the image. Subsequent steps are not lengthy as to run the image.
Using 
> docker ps -a

we can see the the hash of initialized container from our buit image(lets say 213lafl21l).

Now, next time, just start the container using 
```
docker start -it 213lafl21l
docker attach 213lafl21l
```

Now, we have a presistent container id with GUI forwarded to host display.
Test by running
```
xeyes
```

in docker container

![Couldn't fetch the procedure GIF](/images/ex.gif "X-Forward Docker Procedure")

