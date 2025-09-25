#!/bin/bash
./build.py
mv runs/test/final/gds/tt_cell_macro_6{,_orig}.gds
./patch.py
