#!/usr/bin/env python3

# based on https://github.com/TinyTapeout/tinytapeout-ihp-0p1/blob/main/designs/ihp-sg13g2/tt-chip/macros/tt_logo/make_gds.py

import gdspy
from PIL import Image

# Open the image
img = Image.open("art/tt_logo.png")

LAYER = 81  # Metal5
DATATYPE_DRAWING = 0
DATATYPE_SLOT = 3
PIXEL_SIZE = 0.36 # um

LAYER_PR = 0
DATATYPE_BOUNDARY = 0

# Convert the image to grayscale
img = img.convert("L")

layout = gdspy.Cell("tt_logo")
for y in range(img.height):
    for x in range(img.width):
        color = img.getpixel((x, y))
        # Adjust y-coordinate to flip the image vertically
        flipped_y = img.height - y - 1
        if color < 128:
            layout.add(
                gdspy.Rectangle((x * PIXEL_SIZE, flipped_y * PIXEL_SIZE),
                                ((x + 1) * PIXEL_SIZE, (flipped_y + 1) * PIXEL_SIZE),
                                layer=LAYER, datatype=DATATYPE_DRAWING))

layout.add(gdspy.Rectangle((0, 0), (img.width * PIXEL_SIZE, img.height * PIXEL_SIZE),
                           layer=LAYER_PR, datatype=DATATYPE_BOUNDARY))

# Save the layout to a file
gdspy.write_gds("gds/tt_logo.gds")
