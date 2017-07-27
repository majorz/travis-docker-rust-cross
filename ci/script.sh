#!/bin/bash
set -ev

docker build -t $TARGET ci/docker/$TARGET

docker run -it --rm -v ${PWD}:/work $TARGET cargo build --release --target=$TARGET

docker run -it --rm -v ${PWD}:/work $TARGET stripbin target/$TARGET/release/$BINARY
