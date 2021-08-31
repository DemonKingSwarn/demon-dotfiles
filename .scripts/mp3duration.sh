#!/bin/sh
ffmpeg -i $1 2>&1 | grep Duration | sed "s/.*Duration:\s//g" | sed "s/\..*//g"
