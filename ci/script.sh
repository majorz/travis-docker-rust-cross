#!/bin/bash
set -ev

#if [ $TARGET != TEST ]; then

docker build -t $TARGET ci/docker/$TARGET

docker run -it --rm -v ${PWD}:/work $TARGET cargo build --release --target=$TARGET

eval $STRIP target/$TARGET/release/$BINARY
