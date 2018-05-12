FROM ubuntu:18.04
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install xpra
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10000

RUN echo "#!/bin/bash\nxpra start :100 --start-child=\"\$*\" --bind-tcp=0.0.0.0:10000 --no-daemon --exit-with-children" > /usr/bin/run_in_xpra && chmod +x /usr/bin/run_in_xpra
