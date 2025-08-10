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
        # Magic.SpiceExtraction,
        # Checker.IllegalOverlap,
        # Netgen.LVS,
        # Checker.LVS,
        # KLayout.DRC,
        # Checker.KLayoutDRC,
        # Magic.DRC,
        # Checker.MagicDRC,
    ]


shuttle_sources = ["tt_top.v", "counter.v", "basic_mux.v"]

project_sources = [
    (0, 'tt_um_chip_rom',
        ['tt_um_chip_rom.v']),
    (1, 'tt_um_factory_test',
        ['tt_um_factory_test.v']),
    (2, 'tt_um_urish_simon',
        ['simon.v', 'project.v']),
    (3, 'tt_um_vga_clock',
        ['button_pulse.v', 'digit.v', 'fontROM.v', 'tt_vga_clock.v', 'vga_clock.v', 'VgaSyncGen.v']),
    (4, 'tt_um_wokwi_397140982440144897',
        ['cells.v', 'tt_um_wokwi_397140982440144897.v']),
    (5, 'tt_um_wokwi_397142450561071105',
        ['cells.v', 'tt_um_wokwi_397142450561071105.v']),
    (6, 'tt_um_psychogenic_neptuneproportional',
        ['neptune_tinytapeout_propwindow.v']),
    (7, 'tt_um_mattvenn_rgb_mixer',
        ['tt_um_mattvenn_rgb_mixer.v', 'rgb_mixer.v', 'debounce.v', 'pwm.v', 'encoder.v']),
    (8, 'tt_um_dlmiles_muldiv4',
        ['AND_GATE.v', 'AND_GATE_4_INPUTS.v', 'DIVUNIT.v', 'FA.v', 'HA.v', 'Multiplexer_2.v', 'NAND_GATE.v', 'OR_GATE.v',
         'XOR_GATE_ONEHOT.v', 'div4.v', 'mul4.v', 'top_tt_um_dlmiles_muldiv4.v']),
    (9, 'tt_um_top_mole99',
        ['tt_um_top_mole99.sv', 'top.sv', 'sprite_access.sv', 'sprite_data.sv', 'sprite_movement.sv', 'background.sv',
         'timing.sv', 'synchronizer.sv', 'spi_receiver.sv']),
    (10, 'tt_um_tomkeddie_a',
        ['top_tto.v', 'vga.v']),
    (11, 'tt_um_meriac_play_tune',
        ['player.v', 'tune.v']),
    (12, 'tt_um_htfab_rotfpga2',
        ['tile.v', 'grid.v', 'tt_um_htfab_rotfpga2.v']),
    (13, 'tt_um_wokwi_380408823952452609',
        ['cells.v', 'tt_um_wokwi_380408823952452609.v']),
    (14, 'tt_um_flappy_vga_cutout1',
        ['tt_um_flappy_vga_cutout1.v', 'vgaControl.v', 'bitGen.v', 'gameControl.v']),
    (15, 'tt_um_rejunity_ay8913',
        ['attenuation.v', 'tone.v', 'noise.v', 'envelope.v', 'signal_edge.v', 'pwm.v', 'tt_um_rejunity_ay8913.v']),
    (16, 'tt_um_uwuifier',
        ['uart_rx.sv', 'uart_tx.sv', 'uart_fifo.sv', 'uwuifier.sv', 'tt_um_uwuifier.sv']),
    (17, 'tt_um_urish_usb_cdc',
        ['tt_um_usb_cdc.v', 'usb_cdc/bulk_endp.v', 'usb_cdc/ctrl_endp.v', 'usb_cdc/in_fifo.v', 'usb_cdc/out_fifo.v',
         'usb_cdc/phy_rx.v', 'usb_cdc/phy_tx.v', 'usb_cdc/sie.v', 'usb_cdc/usb_cdc.v']),
    (18, 'tt_um_robojan_top',
        ['ball_painter.v', 'block_state.v', 'blocks_painter.v', 'border_painter.v', 'breakout.v', 'game_logic.v',
         'lives_painter.v', 'paddle_painter.v', 'sound_gen.v', 'spi_ctrl.v', 'spi_if.v', 'synchronizer.v',
         'tt_um_robojan_top.v', 'vga_timing.v', 'video_mux.v']),
    (19, 'tt_um_MichaelBell_nanoV',
        ['tt_top.v', 'nanoV/alu.v', 'nanoV/core.v', 'nanoV/cpu.v', 'nanoV/register.v', 'nanoV/shift.v', 'nanoV/multiply.v',
         'nanoV/uart/uart_tx.v', 'nanoV/uart/uart_rx.v']),
    (20, 'tt_um_dinogame',
        ['dinogame.v', 'dinosprite.v', 'jumping.v', 'rendering.v', 'rng.v', 'score.v', 'scroll.v', 'vga.v',
         'tt_um_dinogame.sv']),
    (21, 'tt_um_no_time_for_squares_tommythorn',
        ['tt_um_no_time_for_squares_tommythorn.v', 'clock.v', 'vga.v', 'tile.v']),
    (22, 'tt_um_algofoogle_raybox_zero',
        ['project.v', 'raybox-zero/fixed_point_params.v', 'raybox-zero/helpers.v', 'raybox-zero/rbzero.v',
         'raybox-zero/spi_registers.v', 'raybox-zero/debug_overlay.v', 'raybox-zero/map_overlay.v', 'raybox-zero/map_rom.v',
         'raybox-zero/pov.v', 'raybox-zero/lzc.v', 'raybox-zero/reciprocal.v', 'raybox-zero/wall_tracer.v',
         'raybox-zero/row_render.v', 'raybox-zero/vga_mux.v', 'raybox-zero/vga_sync.v', 'raybox-zero/top_raybox_zero_fsm.v']),
    (23, 'tt_um_kianV_rv32ima_uLinux_SoC',
        ['spi.v', 'divider.v', 'rx_uart.v', 'defines_soc.vh', 'csr_exception_handler.v', 'riscv_defines.vh',
         'rv32_amo_opcodes.vh', 'design_elements.v', 'fifo.v', 'mcause.vh', 'soc.v', 'alu_decoder.v', 'datapath_unit.v',
         'extend.v', 'load_alignment.v', 'alu.v', 'csr_utilities.vh', 'qqspi.v', 'load_decoder.v',
         'riscv_priv_csr_status.vh', 'multiplier_decoder.v', 'csr_decoder.v', 'clint.v', 'register_file.v', 'misa.vh',
         'tx_uart.v', 'tt_um_kianV_rv32ima_uLinux_SoC.v', 'main_fsm.v', 'divider_decoder.v',
         'multiplier_extension_decoder.v', 'multiplier.v', 'store_alignment.v', 'store_decoder.v', 'control_unit.v',
         'kianv_harris_mc_edition.v']),
]

enabled_projects = {
    'tt_um_chip_rom',
    'tt_um_factory_test',
    'tt_um_urish_simon',
    'tt_um_vga_clock',
    'tt_um_wokwi_397140982440144897',
    'tt_um_wokwi_397142450561071105',
    'tt_um_psychogenic_neptuneproportional',
    'tt_um_mattvenn_rgb_mixer',
    'tt_um_dlmiles_muldiv4',
    'tt_um_top_mole99',
    'tt_um_tomkeddie_a',
    'tt_um_meriac_play_tune',
    # 'tt_um_htfab_rotfpga2',
    'tt_um_wokwi_380408823952452609',
    'tt_um_flappy_vga_cutout1',
    # 'tt_um_rejunity_ay8913',
    'tt_um_uwuifier',
    'tt_um_urish_usb_cdc',
    # 'tt_um_robojan_top',
    'tt_um_MichaelBell_nanoV',
    'tt_um_dinogame',
    'tt_um_no_time_for_squares_tommythorn',
    'tt_um_algofoogle_raybox_zero',
    'tt_um_kianV_rv32ima_uLinux_SoC',
}


if __name__ == '__main__':

    PDK_ROOT = os.getenv('PDK_ROOT')
    PDK = 'gf180mcuD'

    sources = [f"dir::src/{i}" for i in shuttle_sources]
    for project_id, project_name, project_files in project_sources:
        if project_name in enabled_projects:
            sources.append(f"dir::src/wrappers/p{project_id:02}_wrapper.v")
            for file in project_files:
                sources.append(f"dir::src/projects/{project_name}/src/{file}")
        else:
            sources.append(f"dir::src/wrappers/p{project_id:02}_wrapper_skip.v")


    flow_cfg = {
        "DESIGN_NAME": "tt_top",
        "VERILOG_FILES": sources,
        "CLOCK_PORT": "in_c__pad[3]",
        "CLOCK_PERIOD": 25,
        "VERILOG_POWER_DEFINE": "USE_POWER_PINS",
        "PDN_ENABLE_GLOBAL_CONNECTIONS": True,
        "SCL_GROUND_PINS": [
            "VSS",
            "DVSS",
            "VPW",
        ],
        "SCL_POWER_PINS": [
            "VDD",
            "DVDD",
            "VNW",
        ],
        "EXTRA_LIBS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lib/gf180mcu_fd_io__tt_025C_5v00.lib",
        ],
        "EXTRA_LEFS": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvss.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__dvdd.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__in_c.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__bi_t.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__asig_5p0.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__cor.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill10.lef",
            "pdk_dir::libs.ref/gf180mcu_fd_io/lef/gf180mcu_fd_io__fill5.lef",
        ],
        "EXTRA_GDS_FILES": [
            "pdk_dir::libs.ref/gf180mcu_fd_io/gds/gf180mcu_fd_io.gds",
        ],
        "DIE_AREA": [0.00, 0.00, 2975.60, 2975.60],
        "CORE_AREA": [435.12, 435.12, 2540.48, 2540.48],
        "FP_SIZING" : "absolute",
        "FP_PDN_CORE_RING": True,
        "FP_PDN_CORE_RING_VWIDTH": 25,
        "FP_PDN_CORE_RING_HWIDTH": 25,
        "FP_PDN_CORE_RING_VOFFSET": 2,
        "FP_PDN_CORE_RING_HOFFSET": 2,
        "FP_PDN_CORE_RING_VSPACING": 3,
        "FP_PDN_CORE_RING_HSPACING": 3,
        "PL_TIME_DRIVEN": False,
    }

    flow = TopFlow(flow_cfg, design_dir=".", pdk_root=PDK_ROOT, pdk=PDK)
    flow.start(tag="test", overwrite=True)

