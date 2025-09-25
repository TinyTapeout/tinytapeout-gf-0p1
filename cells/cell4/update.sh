#!/bin/bash
./build.py
mv runs/test/final/gds/tt_cell_macro_4{,_orig}.gds
./patch.py
