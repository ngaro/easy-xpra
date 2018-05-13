FROM ubuntu:18.04
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install xpra
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV XPRA_DISPLAY=":100"

ARG XPRA_PORT=10000
ENV XPRA_PORT=$XPRA_PORT
EXPOSE $XPRA_PORT

RUN echo "#!/bin/bash\nxpra start \$XPRA_DISPLAY --start-child=\"\$*\" --bind-tcp=0.0.0.0:\$XPRA_PORT --no-daemon --exit-with-children" > /usr/bin/run_in_xpra && chmod +x /usr/bin/run_in_xpra
