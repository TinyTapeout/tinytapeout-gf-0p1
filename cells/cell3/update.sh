#!/bin/bash

SRC=../cell1/runs/test/final
DST=runs/test/final

rm -r $DST

for i in $SRC/lib/*; do
    c=$(basename $i)
    mkdir -p $DST/lib/$c
    sed 's/tt_cell_macro_1/tt_cell_macro_3/g' $SRC/lib/$c/tt_cell_macro_1__$c.lib > $DST/lib/$c/tt_cell_macro_3__$c.lib
done

mkdir -p $DST/lef
sed 's/tt_cell_macro_1/tt_cell_macro_3/g' $SRC/lef/tt_cell_macro_1.lef > $DST/lef/tt_cell_macro_3.lef

mkdir -p $DST/pnl
sed 's/tt_cell_macro_1/tt_cell_macro_3/g' $SRC/pnl/tt_cell_macro_1.pnl.v > $DST/pnl/tt_cell_macro_3.pnl.v

for i in $SRC/spef/*; do
    c=$(basename $i)
    mkdir -p $DST/spef/$c
    sed 's/tt_cell_macro_1/tt_cell_macro_3/g' $SRC/spef/$c/tt_cell_macro_1.$c.spef > $DST/spef/$c/tt_cell_macro_3.$c.spef
done

./patch.py

