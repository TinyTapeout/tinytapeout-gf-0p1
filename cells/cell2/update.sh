#!/bin/bash

SRC=../cell0/runs/test/final
DST=runs/test/final

rm -r $DST

for i in $SRC/lib/*; do
    c=$(basename $i)
    mkdir -p $DST/lib/$c
    sed 's/tt_cell_macro_0/tt_cell_macro_2/g' $SRC/lib/$c/tt_cell_macro_0__$c.lib > $DST/lib/$c/tt_cell_macro_2__$c.lib
done

mkdir -p $DST/lef
sed 's/tt_cell_macro_0/tt_cell_macro_2/g' $SRC/lef/tt_cell_macro_0.lef > $DST/lef/tt_cell_macro_2.lef

mkdir -p $DST/pnl
sed 's/tt_cell_macro_0/tt_cell_macro_2/g' $SRC/pnl/tt_cell_macro_0.pnl.v > $DST/pnl/tt_cell_macro_2.pnl.v

for i in $SRC/spef/*; do
    c=$(basename $i)
    mkdir -p $DST/spef/$c
    sed 's/tt_cell_macro_0/tt_cell_macro_2/g' $SRC/spef/$c/tt_cell_macro_0.$c.spef > $DST/spef/$c/tt_cell_macro_2.$c.spef
done

./patch.py

