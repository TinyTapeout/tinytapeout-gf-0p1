#!/usr/bin/env python3
from klayout import db, pya

source = "runs/test/final/gds/tt_cell_macro_6_orig.gds"
target = "runs/test/final/gds/tt_cell_macro_6.gds"

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
        c.shapes(nplus).clear()
        c.shapes(pplus).clear()

        if c.name.endswith("__tap_2"):
            # manually redraw several layers of the tap cell
            c.shapes(contact).clear()
            c.shapes(contact).insert(db.Box(db.Point(435, 530), db.Point(655, 750)))
            c.shapes(contact).insert(db.Box(db.Point(435, 1000), db.Point(655, 1220)))
            c.shapes(contact).insert(db.Box(db.Point(435, 2160), db.Point(655, 2380)))
            c.shapes(contact).insert(db.Box(db.Point(435, 2630), db.Point(655, 2850)))
            c.shapes(contact).insert(db.Box(db.Point(435, 3100), db.Point(655, 3320)))

            c.shapes(comp).clear()
            c.shapes(comp).insert(db.Box(db.Point(280, 280), db.Point(840, 1290)))
            c.shapes(comp).insert(db.Box(db.Point(360, 1920), db.Point(760, 3560)))

            c.shapes(nplus).insert(db.Box(db.Point(200, 1370), db.Point(920, 3720)))
            c.shapes(pplus).insert(db.Box(db.Point(200, 200), db.Point(920, 1370)))

        # use boolean operators to generate the Nplus / Pplus layers
        nwell_region = pya.Region.new(c.begin_shapes_rec(nwell))
        lvpwell_region = pya.Region.new(c.begin_shapes_rec(lvpwell))
        nplus_region = pya.Region.new(c.begin_shapes_rec(nplus))
        pplus_region = pya.Region.new(c.begin_shapes_rec(pplus))
        pr_boundary_region = pya.Region.new(c.begin_shapes_rec(pr_boundary))

        pr_boundary_bloated = pr_boundary_region.size(200)
        new_nplus_region = (pr_boundary_bloated & lvpwell_region) - pplus_region
        new_pplus_region = (pr_boundary_bloated & nwell_region) - nplus_region

        c.shapes(nplus).insert(new_nplus_region)
        c.shapes(pplus).insert(new_pplus_region)

ly.write(target)
