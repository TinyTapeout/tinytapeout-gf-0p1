#!/bin/bash
pushd cell0
./build.py
popd
pushd cell1
./build.py
popd
pushd cell2
./update.sh
popd
pushd cell3
./update.sh
popd
pushd cell4
./build.py
popd
pushd cell5
./build.py
popd
pushd cell6
./update.sh
popd
pushd cell7
./update.sh
popd
