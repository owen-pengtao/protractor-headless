#!/bin/bash

docker run -it --privileged --rm --net=host webnicer/protractor-headless $1
