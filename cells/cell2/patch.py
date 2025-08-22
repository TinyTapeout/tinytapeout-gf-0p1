#!/usr/bin/env python3
import os
import klayout.db as db

target = "runs/test/final/gds/tt_cell_macro_2.gds"

if ".gds" in target:
    target_orig = target.replace(".gds", "_orig.gds")
else:
    target_orig = target + "_orig"

ly = db.Layout()
ly.read(target)
dualgate = ly.find_layer(55, 0)
if dualgate is None:
    print("Dualgate layer (55/0) not present")
    exit()
ly.delete_layer(dualgate)

for i in range(ly.cells()):
    old_name = ly.cell_name(i)
    new_name = old_name.replace("gf180mcu_fd_", "gf180mcu_hfd_")
    if new_name != old_name:
        ly.rename_cell(i, new_name)

os.rename(target, target_orig)
ly.write(target)
