#!/usr/bin/env python3

import os
import sys

import librelane
from librelane.container import run_in_container
from librelane.flows import Flow


if __name__ == '__main__':

    PDK_ROOT = os.getenv('PDK_ROOT')
    PDK = 'gf180mcuD'

    if "--no-container" not in sys.argv:
        container_image = f"ghcr.io/librelane/librelane:{librelane.__version__}"
        extended_argv = sys.argv + ["--no-container"]
        tty = True
        run_in_container(
            container_image,
            extended_argv,
            pdk_root=PDK_ROOT,
            other_mounts=(),
            tty=tty)
        exit()

    flow_cfg = {
        "STD_CELL_LIBRARY": "gf180mcu_osu_sc_gp9t3v3",
        "STA_CORNERS": ["nom_tt_025C_3v30"],
        "RUN_CVC": False,
        "RUN_MAGIC_DRC": False,
        "GRT_REPAIR_ANTENNAS": False,
        "RUN_HEURISTIC_DIODE_INSERTION": False,

        "PL_TARGET_DENSITY_PCT": 60,
        "CLOCK_PERIOD": 25,
        "PL_RESIZER_HOLD_SLACK_MARGIN": 0.1,
        "GRT_RESIZER_HOLD_SLACK_MARGIN": 0.05,
        "RUN_LINTER": True,
        "LINTER_INCLUDE_PDK_MODELS": True,
        "CLOCK_PORT": "hclk_Y",
        "RUN_KLAYOUT_XOR": False,
        "RUN_KLAYOUT_DRC": False,
        "DESIGN_REPAIR_BUFFER_OUTPUT_PORTS": False,
        "TOP_MARGIN_MULT": 1,
        "BOTTOM_MARGIN_MULT": 1,
        "LEFT_MARGIN_MULT": 6,
        "RIGHT_MARGIN_MULT": 6,
        "FP_SIZING": "absolute",
        "GRT_ALLOW_CONGESTION": True,
        "FP_IO_HLENGTH": 2,
        "FP_IO_VLENGTH": 2,
        "FP_PDN_HPITCH": 28.00,
        "FP_PDN_VPITCH": 28.00,
        "RUN_CTS": True,
        "FP_PDN_CORE_RING": True,
        "FP_PDN_MULTILAYER": True,
        "RT_MAX_LAYER": "Metal5",
        "MAGIC_DEF_LABELS": False,
        "MAGIC_WRITE_LEF_PINONLY": True,
        "DESIGN_NAME": "tt_cell_macro_4",
        "VERILOG_FILES": [
            "dir::src/tt_cell_macro.v",
            "dir::src/heartbeat.v",
        ],
        "DIE_AREA": [0, 0, 125.00, 125.00],
        "CORE_AREA": [15.00, 15.00, 110.00, 110.00],
        "FP_PIN_ORDER_CFG": "dir::pin_order.cfg",
    }

    Classic = Flow.factory.get("Classic")
    flow = Classic(flow_cfg, design_dir=".", pdk_root=PDK_ROOT, pdk=PDK)

    flow.start(tag="test", overwrite=True)

