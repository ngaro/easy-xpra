# easy-xpra

Serves as base for images using xpra but can also be used on it's own

## Tags

* [latest](https://github.com/ngaro/easy-xpra/blob/latest/Dockerfile) uses Alpine as base
* [ubuntu](https://github.com/ngaro/easy-xpra/blob/ubuntu/Dockerfile) uses Ubuntu as base

## Example use as Ubuntu container

* Start a container on `server` : `docker run -p 12345:10000 -ti garo/easy-xpra`
* Install something in the container: `apt-get update && apt-get install x11-apps`
* Run it in xpra: `run_in_xpra xeyes`
* Control/watch the program on a another system : `xpra attach tcp:server:12345`

## Example use of the Alpine version in a new Dockerfile

```
FROM garo/easy-xpra:alpine
RUN apk add --no-cache xterm
CMD ["run_in_xpra", "xterm -background white"]
```
Containers based on this types of Dockerfile are best launched with `-d`

## Extra's

`run_in_xpra` uses 2 environment variables:

* `XPRA_DISPLAY` is the display number of xpra (default `:100`)
* `XPRA_PORT` is the TCP-port on which xpra listens  (default `10000`)

## Development
Want to improve this (bugfixes, extra features, ...) ?

Fork this repository on GitHub instead of cloning it,
I and other users might be interested in your changes !
