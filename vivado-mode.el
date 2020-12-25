;; vivado-mode.el 
;; Major mode for editing Xilinx Design Constraint file (XDC) and Vivado Tcl 
;; scripts in Emacs

;; Copyright (C) 2013 Jim Wu
;;
;; History
;; Feb 2, 2013: initial release
;; Apr 25, 2013: added IPI bd commands/options
;; Dec 24, 2020: Added every Vivado TCL command as a keyword.

;; Author: Jim Wu (jimwu88 at yahoo dot com)
;; Author: Travis Ayres (fpgatravis at reconfigurable dot io)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; USAGE
;; Installation for setting up automatic VIVADO  mode:
;; Save this file in your load path, and add the following lines in your
;; .emacs (uncomment them first)
;; (setq auto-mode-alist (cons  '("\\.xdc\\'" . xdc-mode) auto-mode-alist))
;; (add-hook 'vivado-mode-hook '(lambda () (font-lock-mode 1)))
;; (autoload 'vivado-mode "vivado-mode")

(setq vivado_keywords
  '(("\\<\\(create_slack_histogram\\|tie_unused_pins\\|write_bmm\\|report_ip_status\\|get_timing_paths\\|get_board_ip_preferences\\|register_proc\\|place_ports\\|update_ip_catalog\\|write_iphys_opt_tcl\\|list_features\\|get_drc_ruledecks\\|report_synchronizer_mtbf\\|report_config_timing\\|write_debug_probes\\|report_incremental_reuse\\|reset_switching_activity\\|place_pblocks\\|resize_pin_bus\\|config_compile_simlib\\|encrypt\\|create_partition_def\\|get_site_pips\\|get_template_bd_designs\\|launch_runs\\|delete_ip_run\\|set_delay_model\\|redo\\|report_clocks\\|get_libs\\|delete_waivers\\|get_cells\\|write_cfgmem\\|set_multicycle_path\\|can_resolve_reference\\|reset_property\\|get_ipdefs\\|set_max_time_borrow\\|config_timing_corners\\|report_compile_order\\|add_cells_to_pblock\\|phys_opt_design\\|get_board_component_interfaces\\|delete_rpm\\|write_hwdef\\|write_qor_suggestions\\|read_ip\\|remove_pin\\|get_ports\\|create_debug_port\\|get_bel_pins\\|generate_reports\\|create_gui_custom_command\\|get_highlighted_objects\\|disconnect_debug_port\\|import_ip\\|set_input_jitter\\|create_net\\|list_property\\|move_files\\|modify_debug_ports\\|get_lib_cells\\|set_load\\|current_board\\|remove_net\\|create_clock\\|read_twx\\|get_report_configs\\|get_example_designs\\|open_run\\|set_system_jitter\\|all_rams\\|reset_ssn\\|set_package_pin_val\\|import_xise\\|get_msg_config\\|synth_design\\|create_gui_custom_command_arg\\|get_property\\|set_units\\|create_report_config\\|get_simulators\\|launch_chipscope_analyzer\\|all_hsios\\|get_pblocks\\|rename_pin\\|get_generated_clocks\\|set_clock_groups\\|report_clock_utilization\\|set_operating_conditions\\|report_sdx_utilization\\|delete_debug_core\\|launch_simulation\\|report_simlib_info\\|create_rqs_run\\|stop_gui\\|get_board_component_pins\\|write_dsa\\|report_ram_utilization\\|all_fanin\\|report_power\\|start_gui\\|get_pplocs\\|set_disable_timing\\|delete_power_results\\|report_param\\|get_drc_checks\\|get_pips\\|report_control_sets\\|create_drc_ruledeck\\|list_targets\\|read_verilog\\|delete_pblocks\\|convert_ips\\|write_abstract_shell\\|current_pr_configuration\\|reimport_files\\|current_instance\\|get_drc_violations\\|resize_pblock\\|get_methodology_violations\\|report_waivers\\|make_diff_pair_ports\\|import_synplify\\|delete_pr_configurations\\|config_timing_analysis\\|get_reconfig_modules\\|close_design\\|report_cdc\\|get_hierarchy_separator\\|get_slrs\\|write_checkpoint\\|write_csv\\|set_output_delay\\|remove_port\\|remove_files\\|get_assessment_score\\|reset_drc_check\\|copy_run\\|save_constraints\\|set_clock_uncertainty\\|export_bd_synth\\|set_logic_zero\\|report_clock_networks\\|pr_verify\\|write_mem_info\\|report_operating_conditions\\|report_phys_opt\\|delete_interface\\|show_objects\\|rename_port\\|remove_gui_custom_commands\\|write_project_tcl\\|upgrade_ip\\|validate_dsa\\|update_files\\|route_design\\|get_board_jumpers\\|write_vhdl\\|write_edif\\|set_clock_latency\\|delete_fileset\\|get_board_parameters\\|open_report\\|get_io_standards\\|split_diff_pair_ports\\|create_drc_violation\\|read_edif\\|delete_partition_defs\\|delete_clock_networks_results\\|place_design\\|get_pr_configurations\\|remove_drc_checks\\|config_webtalk\\|get_board_buses\\|generate_base_platform\\|get_iobanks\\|create_run\\|show_schematic\\|get_gui_custom_commands\\|set_logic_dc\\|report_utilization\\|infer_diff_pairs\\|get_path_groups\\|create_interface\\|rename_cell\\|get_board_part_pins\\|get_pins\\|all_inputs\\|get_selected_objects\\|implement_mig_cores\\|delete_drc_ruledeck\\|current_design\\|read_csv\\|update_timing\\|report_pulse_width\\|report_transformed_primitives\\|update_macro\\|delete_dashboard_gadgets\\|list_property_value\\|get_primitives\\|get_marked_objects\\|wait_on_run\\|iphys_opt_design\\|export_ip_user_files\\|create_reconfig_module\\|read_qor_suggestions\\|instantiate_template_bd_design\\|get_dashboard_gadgets\\|get_board_components\\|config_design_analysis\\|create_property\\|report_config_implementation\\|get_timing_arcs\\|unselect_objects\\|get_runs\\|reset_operating_conditions\\|get_tiles\\|extract_files\\|disconnect_net\\|delete_drc_check\\|resize_port_bus\\|set_clock_sense\\|set_part\\|current_fileset\\|get_projects\\|link_design\\|add_filescompile_simlib\\|report_methodology\\|launch_impact\\|remove_cell\\|apply_board_connection\\|launch_sdk\\|generate_target\\|get_nodes\\|reorder_files\\|get_interfaces\\|opt_design\\|lock_design\\|import_files\\|create_pin\\|connect_debug_port\\|create_xps\\|read_saif\\|current_board_part\\|reset_target\\|create_debug_core\\|read_vhdl\\|update_clock_routing\\|check_syntax\\|current_run\\|report_sim_device\\|report_timing_summary\\|report_design_analysis\\|all_clocks\\|set_external_delay\\|get_gui_custom_command_args\\|get_pkgpin_nibbles\\|delete_reconfig_modules\\|rename_net\\|get_package_pins\\|reset_runs\\|remove_cells_from_pblock\\|get_pkgpin_bytegroups\\|import_xst\\|create_drc_check\\|create_port\\|get_parts\\|create_project\\|reset_simulation\\|current_project\\|write_bsdl\\|help\\|set_switching_activity\\|read_xdc\\|all_fanout\\|delete_timing_results\\|set_data_check\\|rename_ref\\|remove_gui_custom_command_args\\|get_board_interface_ports\\|apply_hw_ila_trigger\\|create_generated_clock\\|get_debug_cores\\|write_waivers\\|set_input_delay\\|get_net_delays\\|add_drc_checks\\|get_board_component_modes\\|generate_shx_platform\\|power_opt_design\\|setup_pr_configurations\\|get_designs\\|place_cell\\|copy_ip\\|get_board_parts\\|generate_pblock\\|find_top\\|report_pipeline_analysis\\|refresh_design\\|get_lib_pins\\|read_mem\\|config_ip_cache\\|get_nets\\|write_sdf\\|update_design\\|create_pr_configuration\\|compile_c\\|set_speed_grade\\|get_methodology_checks\\|get_boards\\|create_fileset\\|create_cell\\|report_exceptions\\|get_waivers\\|set_false_path\\|report_timing\\|report_debug_core\\|report_power_opt\\|implement_debug_core\\|delete_macros\\|open_example_project\\|open_checkpoint\\|set_bus_skew\\|report_datasheet\\|delete_runs\\|load_features\\|calc_config_time\\|all_outputs\\|get_ip_upgrade_results\\|set_case_analysis\\|archive_project\\|set_propagated_clock\\|unhighlight_objects\\|reset_timing\\|pr_subdivide\\|instantiate_example_design\\|get_partition_defs\\|all_cpus\\|highlight_objects\\|write_dsa_metadata\\|get_speed_models\\|report_pr_configuration_analysis\\|report_qor_suggestions\\|report_route_status\\|find_routing_path\\|write_verilog\\|create_port_on_reconfigurable_module\\|write_xdc\\|get_board_part_interfaces\\|report_bus_skew\\|add_files\\|set_max_delay\\|save_project_as\\|get_bels\\|get_macros\\|close_project\\|set_msg_config\\|refresh_meminit\\|create_macro\\|report_property\\|get_qor_suggestions\\|open_project\\|all_registers\\|report_disable_timing\\|set_power_opt\\|report_environment\\|connect_debug_cores\\|resize_net_bus\\|set_logic_unconnected\\|unregister_proc\\|config_implementation\\|open_io_design\\|get_ips\\|get_clock_regions\\|implement_xphy_cores\\|get_wires\\|report_switching_activity\\|convert_ngc\\|export_simulation\\|synth_ip\\|check_timing\\|create_waiver\\|create_pblock\\|get_cdc_violations\\|set_min_delay\\|delete_report_configs\\|write_ibis\\|report_qor_assessment\\|create_dashboard_gadget\\|auto_detect_xpm\\|write_sysdef\\|get_sites\\|report_high_fanout_nets\\|generate_rl_platform\\|report_drc\\|swap_locs\\|delete_debug_port\\|get_debug_ports\\|decrypt_bitstream\\|all_latches\\|reset_project\\|set_property\\|write_ip_tcl\\|get_clocks\\|unmark_objects\\|all_dsps\\|set_logic_one\\|connect_net\\|undo\\|report_io\\|write_schematic\\|update_noc_qos\\|version\\|report_ssn\\|open_dsa\\|endgroup\\|filter\\|update_compile_order\\|reset_methodology\\|update_module_reference\\|make_wrapper\\|setup_ip_static_library\\|get_site_pins\\|generate_mem_files\\|get_board_bus_nets\\|set_hierarchy_separator\\|pr_recombine\\|create_ip_run\\|read_iphys_opt_tcl\\|mark_objects\\|startgroup\\|export_as_example_design\\|report_clock_interaction\\|unplace_cell\\|create_ip\\|delete_utilization_results\\|reset_methodology_check\\|report_carry_chains\\|move_dashboard_gadget\\|reset_msg_config\\|reset_msg_count\\|get_files\\|write_bitstream\\|read_checkpoint\\|all_ffs\\|select_objects\\|save_constraints_as\\|read_schematic\\|group_path\\|write_inferred_xdc\\|get_filesets\\|reset_drc\\)\\>" . font-lock-keyword-face)
  )
)


(define-derived-mode vivado-mode tcl-mode
  (setq font-lock-defaults '(vivado_keywords))
  (setq mode-name "vivado mode")
)
  

(provide 'vivado-mode)

