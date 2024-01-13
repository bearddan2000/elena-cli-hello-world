#! /bin/bash

FILE=hello && elena-cli $FILE.l 1>&2 && \
    ./$FILE