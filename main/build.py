#!/usr/bin/env python3

import os
import sys

import librelane
from librelane.container import run_in_container
from librelane.flows import Flow


shuttle_sources = ["tt_main_macro.v", "counter.v", "basic_mux.v"]

project_sources = [
    (0, 'tt_um_chip_rom',
        ['tt_um_chip_rom.v']),
    (1, 'tt_um_factory_test',
        ['tt_um_factory_test.v']),
    (2, 'tt_um_pad_test',
        ['tt_um_pad_test.v']),
    (3, 'tt_um_urish_simon',
        ['simon.v', 'project.v']),
    (4, 'tt_um_vga_clock',
        ['button_pulse.v', 'digit.v', 'fontROM.v', 'tt_vga_clock.v', 'vga_clock.v', 'VgaSyncGen.v']),
    (5, 'tt_um_wokwi_397140982440144897',
        ['cells.v', 'tt_um_wokwi_397140982440144897.v']),
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
    (19, 'tt_um_MichaelBell_tinyQV',
        ['project.v', 'tinyQV/cpu/tinyqv.v', 'tinyQV/cpu/alu.v', 'tinyQV/cpu/core.v', 'tinyQV/cpu/counter.v',
         'tinyQV/cpu/cpu.v', 'tinyQV/cpu/decode.v', 'tinyQV/cpu/mem_ctrl.v', 'tinyQV/cpu/qspi_ctrl.v',
         'tinyQV/cpu/register.v', 'tinyQV/peri/uart/uart_tx.v', 'tinyQV/peri/uart/uart_rx.v', 'tinyQV/peri/spi/spi.v']),
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
        ['spi.v', 'gpio.v', 'divider.v', 'rx_uart.v', 'defines_soc.vh', 'csr_exception_handler.v', 'riscv_defines.vh',
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
    'tt_um_pad_test',
    'tt_um_urish_simon',
    'tt_um_vga_clock',
    'tt_um_wokwi_397140982440144897',
    'tt_um_psychogenic_neptuneproportional',
    'tt_um_mattvenn_rgb_mixer',
    'tt_um_dlmiles_muldiv4',
    'tt_um_top_mole99',
    'tt_um_tomkeddie_a',
    'tt_um_meriac_play_tune',
    'tt_um_htfab_rotfpga2',
    'tt_um_wokwi_380408823952452609',
    'tt_um_flappy_vga_cutout1',
    'tt_um_rejunity_ay8913',
    'tt_um_uwuifier',
    'tt_um_urish_usb_cdc',
    'tt_um_robojan_top',
    'tt_um_MichaelBell_tinyQV',
    'tt_um_dinogame',
    'tt_um_no_time_for_squares_tommythorn',
    'tt_um_algofoogle_raybox_zero',
    'tt_um_kianV_rv32ima_uLinux_SoC',
}


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

    sources = [f"dir::src/{i}" for i in shuttle_sources]
    for project_id, project_name, project_files in project_sources:
        if project_name in enabled_projects:
            sources.append(f"dir::src/wrappers/p{project_id:02}_wrapper.v")
            for file in project_files:
                sources.append(f"dir::src/projects/{project_name}/src/{file}")
        else:
            sources.append(f"dir::src/wrappers/p{project_id:02}_wrapper_skip.v")

    flow_cfg = {
        "PL_TARGET_DENSITY_PCT": 60,
        "CLOCK_PERIOD": 60,
        "PL_RESIZER_HOLD_SLACK_MARGIN": 0.1,
        "GRT_RESIZER_HOLD_SLACK_MARGIN": 0.05,
        "RUN_LINTER": True,
        "LINTER_INCLUDE_PDK_MODELS": True,
        "CLOCK_PORT": "tt_clk_Y",
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
        "FP_PDN_CORE_RING_VWIDTH": 5,
        "FP_PDN_CORE_RING_HWIDTH": 5,
        "FP_PDN_CORE_RING_VOFFSET": 3,
        "FP_PDN_CORE_RING_HOFFSET": 3,
        "FP_PDN_CORE_RING_VSPACING": 2,
        "FP_PDN_CORE_RING_HSPACING": 2,
        "RT_MAX_LAYER": "Metal5",
        "MAGIC_DEF_LABELS": False,
        "MAGIC_WRITE_LEF_PINONLY": True,
        "DESIGN_NAME": "tt_main_macro",
        "VERILOG_FILES": sources,
        "DIE_AREA": [0, 0, 1600.00, 1600.00],
        "CORE_AREA": [25.00, 25.00, 1575.00, 1575.00],
        "FP_PIN_ORDER_CFG": "dir::pin_order.cfg",
        "FALLBACK_SDC_FILE": "dir::base.sdc",
        "SYNTH_LATCH_MAP": "dir::latch_map.v",
    }

    Classic = Flow.factory.get("Classic")
    flow = Classic(flow_cfg, design_dir=".", pdk_root=PDK_ROOT, pdk=PDK)

    flow.start(tag="test", overwrite=True)

