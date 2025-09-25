#!/bin/bash
./build.py
mv runs/test/final/gds/tt_cell_macro_5{,_orig}.gds
./patch.py
