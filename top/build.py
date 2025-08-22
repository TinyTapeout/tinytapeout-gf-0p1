#!/usr/bin/env python3

# Based on https://github.com/TinyTapeout/tt-multiplexer/blob/ihp2025/ol2/tt_top/build.py by Sylvain Munaut

import os

from librelane.common import Path
from librelane.flows.sequential import SequentialFlow
from librelane.steps.openroad import OpenROADStep
from librelane.steps import Step, Yosys, OpenROAD, Magic, Misc, KLayout, Odb, Netgen, Checker


@Step.factory.register()
class PadRing(OpenROADStep):

    id = "TT.Top.PadRing"
    name = "Creates Pad Ring"

    def get_script_path(self):
        return os.path.join(
            os.path.dirname(__file__),
            "padring.tcl"
        )


class TopFlow(SequentialFlow):

    Steps = [
        Yosys.JsonHeader,
        Yosys.Synthesis,
        Checker.YosysUnmappedCells,
        Checker.YosysSynthChecks,
        OpenROAD.Floorplan,
        PadRing,
        Odb.ManualMacroPlacement,
        OpenROAD.GeneratePDN,
        OpenROAD.GlobalPlacement,
        OpenROAD.DetailedPlacement,
        OpenROAD.GlobalRouting,
        OpenROAD.DetailedRouting,
        Checker.TrDRC,
        Odb.ReportDisconnectedPins,
        Checker.DisconnectedPins,
        Odb.ReportWireLength,
        Checker.WireLength,
        OpenROAD.RCX,
        OpenROAD.STAPostPNR,
        # OpenROAD.IRDropReport,
        Magic.StreamOut,
        KLayout.StreamOut,
        KLayout.XOR,
        Checker.XOR,
        Magic.SpiceExtraction,
        Checker.IllegalOverlap,
        # Netgen.LVS,
        # Checker.LVS,
        KLayout.DRC,
        Checker.KLayoutDRC,
        # Magic.DRC,
        # Checker.MagicDRC,
    ]


def macro_config(entries):
    macros = {}
    for name, path, instance, x, y in entries:
        macro = {
            "gds": [f"dir::{path}/runs/test/final/gds/{name}.gds"],
            "lef": [f"dir::{path}/runs/test/final/lef/{name}.lef"],
            "pnl": [f"dir::{path}/runs/test/final/pnl/{name}.pnl.v"],
            "spef": {
                "min_*": [f"dir::{path}/runs/test/final/spef/min/{name}.min.spef"],
                "nom_*": [f"dir::{path}/runs/test/final/spef/nom/{name}.nom.spef"],
                "max_*": [f"dir::{path}/runs/test/final/spef/max/{name}.max.spef"],
            },
            "lib": {},
            "instances": {
                instance: {
                    "location": [x, y],
                    "orientation": "N",
                }
            }
        }
        for corner in os.listdir(f"{path}/runs/test/final/lib"):
            macro["lib"][corner] = [f"dir::{path}/runs/test/final/lib/{corner}/{name}__{corner}.lib"]
        macros[name] = macro
    return macros


if __name__ == '__main__':

    PDK_ROOT = os.getenv('PDK_ROOT')
    PDK = 'gf180mcuD'

    sources = [
        "dir::src/tt_top.v",
        "dir::src/blackbox/tt_main_macro.v",
        "dir::src/blackbox/tt_cell_macro_0.v",
        "dir::src/blackbox/tt_cell_macro_1.v",
        "dir::src/blackbox/tt_cell_macro_2.v",
        "dir::src/blackbox/tt_cell_macro_3.v",
        "dir::src/blackbox/tt_cell_macro_4.v",
        "dir::src/blackbox/tt_cell_macro_5.v",
        "dir::src/blackbox/tt_cell_macro_6.v",
        "dir::src/blackbox/tt_cell_macro_7.v",
    ]

    flow_cfg = {
        "DESIGN_NAME": "tt_top",
        "VERILOG_FILES": sources,
        "MACROS": macro_config([
            ("tt_main_macro", "../main", "main_inst", 588, 588),
            ("tt_cell_macro_0", "../cells/cell0", "cell_inst_0", 588, 2434),
            ("tt_cell_macro_1", "../cells/cell1", "cell_inst_1", 417, 2263),
            ("tt_cell_macro_2", "../cells/cell2", "cell_inst_2", 417, 588),
            ("tt_cell_macro_3", "../cells/cell3", "cell_inst_3", 588, 417),
            ("tt_cell_macro_4", "../cells/cell4", "cell_inst_4", 2263, 417),
            ("tt_cell_macro_5", "../cells/cell5", "cell_inst_5", 2434, 588),
            ("tt_cell_macro_6", "../cells/cell6", "cell_inst_6", 2434, 2263),
            ("tt_cell_macro_7", "../cells/cell7", "cell_inst_7", 2263, 2434),
        ]),
        "CLOCK_PORT": "digital_pad[2]",
        "CLOCK_PERIOD": 25,
        "VERILOG_POWER_DEFINE": "USE_POWER_PINS",
        "VDD_NETS": [f"vddcore[{i}]" for i in range(5)],
        "GND_NETS": [f"vsscore[{i}]" for i in range(5)],
        "PDN_MACRO_CONNECTIONS": [
            "main_inst vddcore[0] vsscore[0] VDD VSS",
            "cell_inst_0 vddcore[1] vsscore[1] VDD VSS",
            "cell_inst_1 vddcore[1] vsscore[1] VDD VSS",
            "cell_inst_2 vddcore[2] vsscore[2] VDD VSS",
            "cell_inst_3 vddcore[2] vsscore[2] VDD VSS",
            "cell_inst_4 vddcore[3] vsscore[3] VDD VSS",
            "cell_inst_5 vddcore[3] vsscore[3] VDD VSS",
            "cell_inst_6 vddcore[4] vsscore[4] VDD VSS",
            "cell_inst_7 vddcore[4] vsscore[4] VDD VSS",
        ],
        "IGNORE_DISCONNECTED_MODULES": [
            "gf180mcu_ht_io__brk5_vss_dvss",
            "gf180mcu_ht_io__brk5_vss_dvss_dvdd",
        ],
        "EXTRA_LIBS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__tt_025C_5v00.lib",
        ],
        "EXTRA_LEFS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvdd.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_c.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_s.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_t.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_24t.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__asig_5p0.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__cor.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill10.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill5.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_vdd_dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_dvss_dvdd.lef",
        ],
        "EXTRA_GDS_FILES": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/gds/gf180mcu_ht_io_brk.gds",
        ],
        "DIE_AREA": [0.00, 0.00, 2975.60, 2975.60],
        "CORE_AREA": [435.12, 435.12, 2540.48, 2540.48],
        "FP_SIZING" : "absolute",
        "FP_PDN_MULTILAYER": False,
        "FP_PDN_ENABLE_RAILS": False,
    }

    flow = TopFlow(flow_cfg, design_dir=".", pdk_root=PDK_ROOT, pdk=PDK)
    flow.start(tag="test", overwrite=True)

