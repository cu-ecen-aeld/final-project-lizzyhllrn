#!/bin/sh

case "$1" in
    start)
        echo "loading mods"
        modprobe uvcvideo
        ;;
    stop)
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac

exit 0