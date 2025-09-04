#!/usr/bin/env python3
import os
import klayout.db as db

source = "../cell0/runs/test/final/gds/tt_cell_macro_0.gds"
target = "runs/test/final/gds/tt_cell_macro_2.gds"

os.makedirs(os.path.dirname(target), exist_ok=True)

ly = db.Layout()
ly.read(source)
dualgate = ly.find_layer(55, 0)
if dualgate is not None:
    ly.delete_layer(dualgate)

for i in range(ly.cells()):
    old_name = ly.cell_name(i)
    new_name = old_name.replace("gf180mcu_fd_", "gf180mcu_hfd_").replace("tt_cell_macro_0", "tt_cell_macro_2")
    if new_name != old_name:
        ly.rename_cell(i, new_name)

ly.write(target)
