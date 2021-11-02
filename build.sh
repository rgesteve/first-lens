#!/usr/bin/env bash

# Not sure why I need this, the default (18.14) should work
RESOLVER=nightly

stack build --allow-different-user --resolver=${RESOLVER}
stack exec first-lens --allow-different-user --resolver=${RESOLVER}

