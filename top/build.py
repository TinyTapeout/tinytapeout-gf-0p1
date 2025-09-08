#!/usr/bin/env python3

# Based on https://github.com/TinyTapeout/tt-multiplexer/blob/ihp2025/ol2/tt_top/build.py by Sylvain Munaut

import os

from librelane.common import Path
from librelane.flows import Flow
from librelane.flows.sequential import SequentialFlow
from librelane.steps.openroad import OpenROADStep
from librelane.steps import Step, Verilator, Yosys, OpenROAD, Magic, Misc, KLayout, Odb, Netgen, Checker


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
        #Verilator.Lint,
        #Checker.LintTimingConstructs,
        #Checker.LintErrors,
        #Checker.LintWarnings,
        Yosys.JsonHeader,
        Yosys.Synthesis,
        Checker.YosysUnmappedCells,
        Checker.YosysSynthChecks,
        #Checker.NetlistAssignStatements,
        #OpenROAD.CheckSDCFiles,
        #OpenROAD.CheckMacroInstances,
        #OpenROAD.STAPrePNR,
        OpenROAD.Floorplan,
        PadRing,
        #OpenROAD.DumpRCValues,
        #Odb.CheckMacroAntennaProperties,
        #Odb.SetPowerConnections,
        Odb.ManualMacroPlacement,
        #OpenROAD.CutRows,
        #OpenROAD.TapEndcapInsertion,
        #Odb.AddPDNObstructions,
        OpenROAD.GeneratePDN,
        #Odb.RemovePDNObstructions,
        #Odb.AddRoutingObstructions,
        #OpenROAD.GlobalPlacementSkipIO,
        #OpenROAD.IOPlacement,
        #Odb.CustomIOPlacement,
        #Odb.ApplyDEFTemplate,
        OpenROAD.GlobalPlacement,
        #Odb.WriteVerilogHeader,
        #Checker.PowerGridViolations,
        #OpenROAD.STAMidPNR,
        #OpenROAD.RepairDesignPostGPL,
        #Odb.ManualGlobalPlacement,
        OpenROAD.DetailedPlacement,
        #OpenROAD.CTS,
        #OpenROAD.STAMidPNR,
        #OpenROAD.ResizerTimingPostCTS,
        #OpenROAD.STAMidPNR,
        OpenROAD.GlobalRouting,
        #OpenROAD.CheckAntennas,
        #OpenROAD.RepairDesignPostGRT,
        #Odb.DiodesOnPorts,
        #Odb.HeuristicDiodeInsertion,
        #OpenROAD.RepairAntennas,
        #OpenROAD.ResizerTimingPostGRT,
        #OpenROAD.STAMidPNR,
        OpenROAD.DetailedRouting,
        #Odb.RemoveRoutingObstructions,
        #OpenROAD.CheckAntennas,
        Checker.TrDRC,
        Odb.ReportDisconnectedPins,
        Checker.DisconnectedPins,
        Odb.ReportWireLength,
        Checker.WireLength,
        #OpenROAD.FillInsertion,
        #Odb.CellFrequencyTables,
        OpenROAD.RCX,
        OpenROAD.STAPostPNR,
        ##OpenROAD.IRDropReport,
        Magic.StreamOut,
        KLayout.StreamOut,
        #Magic.WriteLEF,
        #Odb.CheckDesignAntennaProperties,
        KLayout.XOR,
        Checker.XOR,
        ##Magic.DRC,
        #KLayout.DRC,
        ##Checker.MagicDRC,
        #Checker.KLayoutDRC,
        Magic.SpiceExtraction,
        Checker.IllegalOverlap,
        Netgen.LVS,
        ##Checker.LVS,
        #Yosys.EQY,
        #Checker.SetupViolations,
        #Checker.HoldViolations,
        #Checker.MaxSlewViolations,
        #Checker.MaxCapViolations,
        #Misc.ReportManufacturability,
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

def extra_macro_config(entries):
    macros = {}
    for name, path, instance, x, y in entries:
        macro = {
            "gds": [f"dir::{path}/gds/{name}.gds"],
            "lef": [f"dir::{path}/lef/{name}.lef"],
            "pnl": [f"dir::{path}/pnl/{name}.pnl.v"],
            "instances": {
                instance: {
                    "location": [x, y],
                    "orientation": "N",
                }
            }
        }
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
        "dir::src/blackbox/loopback.v",
        "dir::src/blackbox/tt_logo.v",
    ]

    flow_cfg = {
        "DESIGN_NAME": "tt_top",
        "VERILOG_FILES": sources,
        "VERILOG_DEFINES": [
            "CONNECT_POWER_PADS",
            "CONNECT_ANALOG_PADS",
        ],
        "SYNTH_ELABORATE_ONLY": True,
        "MACROS": {**macro_config([
            ("tt_main_macro", "../main", "main_inst", 688, 688),
            ("tt_cell_macro_0", "../cells/cell0", "cell_inst_0", 688, 2334),
            ("tt_cell_macro_1", "../cells/cell1", "cell_inst_1", 417, 2063),
            ("tt_cell_macro_2", "../cells/cell2", "cell_inst_2", 417, 688),
            ("tt_cell_macro_3", "../cells/cell3", "cell_inst_3", 688, 417),
            ("tt_cell_macro_4", "../cells/cell4", "cell_inst_4", 2063, 417),
            ("tt_cell_macro_5", "../cells/cell5", "cell_inst_5", 2334, 688),
            ("tt_cell_macro_6", "../cells/cell6", "cell_inst_6", 2334, 2063),
            ("tt_cell_macro_7", "../cells/cell7", "cell_inst_7", 2063, 2334),
        ]), **extra_macro_config([
            ("loopback", "macros/loopback", "loop_inst", 1037.8, 380),
            ("tt_logo", "macros/tt_logo", "logo_inst", 2334, 417),
        ])},
        "CLOCK_PORT": "digital_pad[2]",
        "CLOCK_PERIOD": 25,
        "VERILOG_POWER_DEFINE": "USE_POWER_PINS",
        "VDD_NETS": [f"vddcore{i}" for i in range(5)],
        "GND_NETS": ["vss" for i in range(5)],
        "PDN_ENABLE_GLOBAL_CONNECTIONS": False,
        "PDN_MACRO_CONNECTIONS": [
            "main_inst vddcore0 vss VDD VSS",
            "cell_inst_0 vddcore1 vss VDD VSS",
            "cell_inst_1 vddcore1 vss VDD VSS",
            "cell_inst_2 vddcore2 vss VDD VSS",
            "cell_inst_3 vddcore2 vss VDD VSS",
            "cell_inst_4 vddcore3 vss VDD VSS",
            "cell_inst_5 vddcore3 vss VDD VSS",
            "cell_inst_6 vddcore4 vss VDD VSS",
            "cell_inst_7 vddcore4 vss VDD VSS",
        ],
        "IGNORE_DISCONNECTED_MODULES": [
            "gf180mcu_ht_io__brk5_vss_dvss",
            "gf180mcu_ht_io__brk5_vss_dvss_dvdd",
            "loop_inst",
            "logo_inst",
        ],
        "EXTRA_LIBS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__tt_025C_5v00.lib",
            "pdk_dir::libs.ref/gf180mcu_ht_io_fix/lib/gf180mcu_ht_io_fix__tt_025C_5v00.lib",
        ],
        "EXTRA_LEFS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_c.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_s.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_t.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_24t.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__cor.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill10.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill5.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_fix/lef/gf180mcu_ht_io_fix__dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_fix/lef/gf180mcu_ht_io_fix__dvdd.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_fix/lef/gf180mcu_ht_io_fix__asig_5p0.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_vdd_dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_ht_io_brk/lef/gf180mcu_ht_io__brk5_vss_dvss_dvdd.lef",
        ],
        "EXTRA_GDS_FILES": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds",
            "pdk_dir::libs.ref/gf180mcu_ht_io_fix/gds/gf180mcu_ht_io_fix.gds",
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

