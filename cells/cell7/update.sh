#!/bin/bash
./build.py
mv runs/test/final/gds/tt_cell_macro_7{,_orig}.gds
./patch.py
