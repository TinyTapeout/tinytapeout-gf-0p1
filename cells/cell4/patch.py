#!/usr/bin/env python3
from klayout import db, pya

source = "runs/test/final/gds/tt_cell_macro_4_orig.gds"
target = "runs/test/final/gds/tt_cell_macro_4.gds"

ly = db.Layout()
ly.read(source)

comp = ly.find_layer(22, 0)
nwell = ly.find_layer(21, 0)
lvpwell = ly.find_layer(204, 0)
nplus = ly.find_layer(32, 0)
pplus = ly.find_layer(31, 0)
contact = ly.find_layer(33, 0)
pr_boundary = ly.find_layer(0, 0)

for c in ly.each_cell():
    if c.name.startswith("gf180mcu_") and "_sc" in c.name:

        width = next(iter(c.begin_shapes_rec(nwell))).shape().box.p2.x

        c.shapes(pr_boundary).insert(db.Box(db.Point(0, 0), db.Point(width, 6350)))

        c.shapes(nwell).clear()
        c.shapes(nwell).insert(db.Box(db.Point(-600, 3150), db.Point(width+600, 6350)))

        fixup = []
        for shi in c.begin_shapes_rec(nplus):
            box = shi.shape().box
            x1, y1, x2, y2 = box.p1.x, box.p1.y, box.p2.x, box.p2.y
            if x1 <= 390 and not c.name.endswith("__or2_1"):
                x1 = 200
            if x2 >= width-390:
                x2 = width-200
            if x2 - x1 < 400:
                continue
            if y2 >= 6260:
                y2 = 6350
                fixup.append(db.Box(db.Point(-600, 6050), db.Point(width+600, 6650)))
            fixup.append(db.Box(db.Point(x1, y1), db.Point(x2, y2)))
        c.shapes(nplus).clear()
        for box in fixup:
            c.shapes(nplus).insert(box)

ly.write(target)
