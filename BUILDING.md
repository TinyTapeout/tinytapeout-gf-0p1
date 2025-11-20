# Build Tiny Tapeout GF 0p1

## Environment setup

- Clone the [GF180MCU PDK snapshot](https://github.com/htfab/ttgf0p1-pdk-snapshot)
    repo with OSU & AS stdcells and patched io cells
- Clone the [LibreLane](https://github.com/librelane/librelane) repo and check out
    commit `948d921862e2ac0e1e8b56322bceaf6cbfe56238`
- Start `nix-shell` from the librelane repo root
- Change to the the root directory of this repo (`tinytapeout-gf-0p1`)
- Set `PDK` to `gf180mcuD`
- Set `PDK_ROOT` to the PDK snapshot downloaded in the first step

## Harden

First harden all the digital macros:
- run `build_all.sh` from the `cells` directory
- run `build.py` from the `main` directory
- run `build.py` from the `buffer` directory

Then assemble the top level:
- run `build.py` from the `top` directory

## Generate fill

- open the generated design with KLayout for editing:
    - run `klayout -e top/runs/test/final/gds/tt_top.gds`
- import the fill cells into the design:
    - File > Import > Other Files Into Current
    - select `top/macros/fill/fill.gds`
    - set import mode to "Extra cells"
- add fill for the COMP layer
    - in the layer list, select COMP, Nwell, LVPWELL, Dualgate and Poly2
        (hold the <kbd>Ctrl</kbd> key to select multiple layers)
    - Edit > Utilities > Fill Tool
    - on the "Fill Area" tab, pick "All (whole cell)" and
        set the margin to 3.5 um
    - on the "Excluded Areas" tab, pick "Selected layers" and
        set the spacing to 2 um
    - on the "Fill Cell" tab, set the fill cell to `fill_comp`
        and the boundary layer to `PR_bndry 0/0`
    - leave the other settings at their defaults
    - press "OK" and wait for the fill to be added
- add fill for Poly2 and metal layers
    - repeat the above procedure for Poly2 and each metal layer, each time
        selecting a different set of layers to exclude and a different
        fill cell, but keeping the other options the same
    - for Poly2, the fill cell is `fill_poly2` and the excluded
        layers are COMP, Nwell, LVPWELL, Dualgate and Poly2
        (same as above)
    - for Metal1, the fill cell is `fill_metal1` and the excluded
        layers are Poly2, Metal1 and Metal2
    - for Metal2, the fill cell is `fill_metal2` and the excluded
        layers are Metal1, Metal2 and Metal3
    - for Metal3, the fill cell is `fill_metal3` and the excluded
        layers are Metal2, Metal3 and Metal4
    - for Metal4, the fill cell is `fill_metal4` and the excluded
        layers are Metal3, Metal4 and Metal5
    - for Metal5, the fill cell is `fill_metal5` and the excluded
        layers are Metal4 and Metal5
- use File > Save As to save the gds file with the fill

