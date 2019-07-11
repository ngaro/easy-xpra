# easy-xpra

Serves as base for images using xpra but can also be used on it's own

## Example usage as a seperate image

* Start a container on `server` : `docker run -p 12345:10000 -ti garo/easy-xpra:alpine`
* Install something in the container: `apk add --no-cache xeyes`
* Run it in xpra: `run_in_xpra xeyes`
* Control/watch the program on a another system : `xpra attach tcp:server:12345`

## Example use in a new Dockerfile

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
