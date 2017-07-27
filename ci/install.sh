#!/bin/bash
set -ev

apt-get -qq update
apt-get install -yq --no-install-recommends libdbus-1-dev

type -p cargo-install-update || cargo install cargo-update

cargo install-update -i cargo-update
cargo install-update -i rustfmt

if [ $TRAVIS_RUST_VERSION == nightly ]; then
    cargo clippy -V;
    if [ $? == 0 ]; then
        cargo install-update -i clippy;
    else
        cargo install-update -i -f clippy;
    fi
fi
