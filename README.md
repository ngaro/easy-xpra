# easy-xpra

Serves as base for images using xpra but can also be used on it's own

## Example usage as a seperate image

* Start a container on `server` : `docker run -p 12345:10000 -ti garo/easy-xpra`
* Install something in the container: `apt-get update && apt-get install x11-apps`
* Run it in xpra: `run_in_xpra xeyes`
* Control/watch the program on a another system : `xpra attach tcp:server:12345`

## Example use in a new Dockerfile

```
FROM garo/easy-xpra:latest
RUN apt-get update && apt-get -y install xterm
CMD ["run_in_xpra", "xterm -background white"]
```
Containers based on this types of Dockerfile are best launched with `-d`

## Extra's

`run_in_xpra` uses 2 environment variables:

* `XPRA_DISPLAY` is the display number of xpra (default `:100`)
* `XPRA_PORT` is the TCP-port on which xpra listens  (default `10000`)
