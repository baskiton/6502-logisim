#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")

PROJECTDIR=$(pwd)
BUILDDIR=$PROJECTDIR/build

cmake -S $PROJECTDIR -B $BUILDDIR
cmake --build $BUILDDIR -j -- PROJECT_DIR="$PROJECTDIR"
