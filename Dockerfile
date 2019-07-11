FROM alpine:3.9
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

RUN apk add --no-cache --update xpra
RUN cp /etc/xpra/xorg.conf /etc/X11/xorg.conf.d/00_xpra.conf
RUN echo "xvfb=Xorg" >> /etc/xpra/xpra.conf

ENV XPRA_DISPLAY=":100"

ARG XPRA_PORT=10000
ENV XPRA_PORT=$XPRA_PORT
EXPOSE $XPRA_PORT

COPY run_in_xpra /usr/bin/run_in_xpra
