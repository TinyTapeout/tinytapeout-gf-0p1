#!/bin/bash

BUILD=FALSE
SEAL=FALSE
FILL=TRUE
CHECK=TRUE

DIE_WIDTH=2975.60
DIE_HEIGHT=2975.60

if [ "$BUILD" == "TRUE" ]
then
    ./build.py
fi

GDS=runs/test/final/gds/tt_top.gds

if [ "$SEAL" == "TRUE" ]
then
    NEW_GDS=runs/test/final/gds/tt_top.seal.gds
    python3 scripts/gf180mcu_seal_ring.py --input-gds $GDS --output-gds $NEW_GDS --die-width $DIE_WIDTH --die-height $DIE_HEIGHT
    GDS=$NEW_GDS
fi

if [ "$FILL" == "TRUE" ]
then
    NEW_GDS=runs/test/final/gds/tt_top.fill.gds
    klayout -b -zz -r $PDK_ROOT/$PDK/libs.tech/klayout/tech/drc/filler_generation/fill_all.rb -rd input=$GDS -rd output=$NEW_GDS
    GDS=$NEW_GDS
fi

if [ "$CHECK" == "TRUE" ]
then
    klayout -b -zz -r $PDK_ROOT/$PDK/libs.tech/klayout/tech/drc/rule_decks/density.drc -rd input=$GDS
fi
