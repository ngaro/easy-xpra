# easy-xpra

Serve as base for images using xpra but can be used on it's own

## Example usage as a seperate image

* Start a container on `server` : `docker run -p 12345:10000 -ti garo/easy-xpra`
* Install something in the container: `apt-get update && apt-get install x11-apps`
* Run it in xpra: `run_in_xpra xeyes`
* Control/watch the program on a another system : `xpra attach tcp:server:12345`
