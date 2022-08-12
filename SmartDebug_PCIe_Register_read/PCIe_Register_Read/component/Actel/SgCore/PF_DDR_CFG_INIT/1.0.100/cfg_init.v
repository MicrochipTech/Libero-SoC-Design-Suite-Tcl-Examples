module PF_DDR_CFG_INIT (
    cfg_zqinit_cal_duration,
    cfg_zq_cal_type,
    cfg_zq_cal_s_duration,
    cfg_zq_cal_r_duration,
    cfg_zq_cal_per,
    cfg_zq_cal_l_duration,
    cfg_xsr,
    cfg_xsdll,
    cfg_xs,
    cfg_xpr,
    cfg_xp,
    cfg_wtr_s_crc_dm,
    cfg_wtr_s,
    cfg_wtr_l_crc_dm,
    cfg_wtr_l,
    cfg_wtr,
    cfg_write_to_write_odt,
    cfg_write_to_write,
    cfg_write_to_read_odt,
    cfg_write_to_read,
    cfg_write_dbi,
    cfg_write_crc,
    cfg_wr_preamble,
    cfg_wr_crc_dm,
    cfg_wr_cmd_lat_crc_dm,
    cfg_wr,
    cfg_wl,
    cfg_vrefdq_trn_value,
    cfg_vrefdq_trn_range,
    cfg_vrefdq_trn_enable,
    cfg_two_t_sel_cycle,
    cfg_two_t,
    cfg_trig_mode,
    cfg_trig_mask,
    cfg_temp_sensor_readout,
    cfg_temp_ctrl_ref_range,
    cfg_temp_ctrl_ref_mode,
    cfg_tdqs,
    cfg_starve_timeout_p7,
    cfg_starve_timeout_p6,
    cfg_starve_timeout_p5,
    cfg_starve_timeout_p4,
    cfg_starve_timeout_p3,
    cfg_starve_timeout_p2,
    cfg_starve_timeout_p1,
    cfg_starve_timeout_p0,
    cfg_pre_trig_cycs, 
    cfg_startup_delay,
    cfg_srt,
    cfg_sr_abort,
    cfg_rtt_wr,
    cfg_rtt_park,
    cfg_rtt,
    cfg_rtp,
    cfg_rrd_s,
    cfg_rrd_l,
    cfg_rrd_dlr,
    cfg_rrd,
    cfg_rp,
    cfg_rowaddr_map,
    cfg_rmw_en,
    cfg_rl,
    cfg_rfc_dlr4,
    cfg_rfc_dlr2,
    cfg_rfc_dlr1,
    cfg_rfc4,
    cfg_rfc2,
    cfg_rfc1,
    cfg_rfc,
    cfg_regdimm,
    cfg_ref_per,
    cfg_read_to_write_odt,
    cfg_read_to_write,
    cfg_read_to_read_odt,
    cfg_read_to_read,
    cfg_read_dbi,
    cfg_rdimm_lat,
    cfg_rdimm_bside_invert,
    cfg_rd_preamble,
    cfg_rd_preamb_trn_mode,
    cfg_rcd_stab,
    cfg_rcd,
    cfg_rc,
    cfg_ras,
    cfg_quad_rank,
    cfg_qoff,
    cfg_post_trig_cycs,
    cfg_phyupd_ack_delay,
    cfg_per_dram_addr_en,
    cfg_pasr_seg,
    cfg_pasr_bank,
    cfg_pasr,
    cfg_parity_rdimm_delay,
    cfg_only_srank_cmds,
    cfg_odt_wr_turn_on,
    cfg_odt_wr_turn_off,
    cfg_odt_wr_map_cs7,
    cfg_odt_wr_map_cs6,
    cfg_odt_wr_map_cs5,
    cfg_odt_wr_map_cs4,
    cfg_odt_wr_map_cs3,
    cfg_odt_wr_map_cs2,
    cfg_odt_wr_map_cs1,
    cfg_odt_wr_map_cs0,
    cfg_odt_rd_turn_on,
    cfg_odt_rd_turn_off,
    cfg_odt_rd_map_cs7,
    cfg_odt_rd_map_cs6,
    cfg_odt_rd_map_cs5,
    cfg_odt_rd_map_cs4,
    cfg_odt_rd_map_cs3,
    cfg_odt_rd_map_cs2,
    cfg_odt_rd_map_cs1,
    cfg_odt_rd_map_cs0,
    cfg_odt_powerdown,
    cfg_odt_inbuf_4_pd,
    cfg_num_ranks,
    cfg_num_logical_ranks_per_3ds,
    cfg_num_cal_reads,
    cfg_nibble_devices,
    cfg_mrw,
    cfg_mrri,
    cfg_mrr,
    cfg_mpr_read_format,
    cfg_mod,
    cfg_mirror_x16_bg0_bg1,
    cfg_min_read_idle,
    cfg_memory_type,
    cfg_mem_rowbits,
    cfg_mem_colbits,
    cfg_mem_bankbits,
    cfg_mb_autopch_col_bit_pos_low,
    cfg_mb_autopch_col_bit_pos_high,
    cfg_max_pwr_down_mode,
    cfg_manual_address_map,
    cfg_lrdimm,
    cfg_lp_asr,
    cfg_lookahead_pch,
    cfg_lookahead_act,
    cfg_int_vref_mon,
    cfg_init_duration,
    cfg_idle_time_to_self_refresh,
    cfg_idle_time_to_power_down,
    cfg_geardown_mode,
    cfg_fine_gran_ref_mode,
    cfg_faw_dlr,
    cfg_faw,
    cfg_error_group_sel,
    cfg_en_mask,
    cfg_emr3,
    cfg_ecc_correction_en,
    cfg_early_rank_to_wr_start,
    cfg_early_rank_to_rd_start,
    cfg_ds,
    cfg_dram_clk_disable_in_self_refresh,
    cfg_dm_en,
    cfg_dll_disable,
    cfg_dfi_t_rddata_en,
    cfg_dfi_t_phy_wrlat,
    cfg_dfi_t_phy_rdlat,
    cfg_dfi_t_dram_clk_enable,
    cfg_dfi_t_ctrlupd_max,
    cfg_dfi_t_ctrl_delay,
    cfg_dfi_phyupd_en,
    cfg_dfi_lvl_sel,
    cfg_dfi_lvl_periodic,
    cfg_dfi_lvl_pattern,
    cfg_dfi_data_byte_disable,
    cfg_data_sel,
    cfg_data_sel_first_error,
    cfg_data_mask,
    cfg_cwl,
    cfg_ctrlupd_trig,
    cfg_ctrlupd_start_delay,
    cfg_ctrlr_init_disable,
    cfg_ctrlr_busy_value,
    cfg_ctrlr_busy_turn_off_delay,
    cfg_ctrlr_busy_slow_restart_window,
    cfg_ctrlr_busy_sel,
    cfg_ctrlr_busy_restart_holdoff,
    cfg_ctrlr_busy_enable,
    cfg_cs_to_cmdaddr_latency,
    cfg_crc_error_clear,
    cfg_coladdr_map,
    cfg_cl,
    cfg_cksrx,
    cfg_cksre,
    cfg_cidaddr_map,
    cfg_chipaddr_map,
    cfg_ccd_s,
    cfg_ccd_l,
    cfg_cal_read_period,
    cfg_ca_parity_persist_err,
    cfg_ca_parity_latency,
    cfg_ca_parity_err_status,
    cfg_burst_rw_refresh_holdoff,
    cfg_bt,
    cfg_bl_mode,
    cfg_bl,
    cfg_bit_map_index_cs9,
    cfg_bit_map_index_cs8,
    cfg_bit_map_index_cs7,
    cfg_bit_map_index_cs6,
    cfg_bit_map_index_cs5,
    cfg_bit_map_index_cs4,
    cfg_bit_map_index_cs3,
    cfg_bit_map_index_cs2,
    cfg_bit_map_index_cs15,
    cfg_bit_map_index_cs14,
    cfg_bit_map_index_cs13,
    cfg_bit_map_index_cs12,
    cfg_bit_map_index_cs11,
    cfg_bit_map_index_cs10,
    cfg_bit_map_index_cs1,
    cfg_bit_map_index_cs0,
    cfg_bg_interleave,
    cfg_bankaddr_map,
    cfg_auto_zq_cal_en,
    cfg_auto_sr,
    cfg_auto_ref_en,
    cfg_async_odt,
    cfg_al_mode,
    cfg_addr_mirror,
    axi0_cfg_axi_start_address,
    axi0_cfg_axi_end_address,
    axi0_cfg_mem_start_address,
    axi0_cfg_enable_bus_hold,
    phy_train_step_enable,
    ADDR_WAIT_COUNT,
    WRCAL_WRITE_COUNTER_VALUE,
    RDGATE_MIN_READS_THRESHOLD,
    phy_gate_train_delay,
    phy_eye_train_delay,
    ADDR_VCOPHS_OFFSET
);

    parameter SKIP_STARTUP_DELAY_SIMULATION = 1;
    parameter SKIP_TRAINING_SIMULATION = 1;
    parameter DEF_CFG_ZQINIT_CAL_DURATION = 12'h000;
    parameter DEF_CFG_ZQ_CAL_TYPE = 2'h1;
    parameter DEF_CFG_ZQ_CAL_S_DURATION = 11'h000;
    parameter DEF_CFG_ZQ_CAL_R_DURATION = 11'h000;
    parameter DEF_CFG_ZQ_CAL_PER = 32'h00027100;
    parameter DEF_CFG_ZQ_CAL_L_DURATION = 11'h000;
    parameter DEF_CFG_XSR = 9'h000;
    parameter DEF_CFG_XSDLL = 11'h000;
    parameter DEF_CFG_XS = 9'h060;
    parameter DEF_CFG_XPR = 10'h060;
    parameter DEF_CFG_XP = 5'h00;
    parameter DEF_CFG_WTR_S_CRC_DM = 4'h0;
    parameter DEF_CFG_WTR_S = 3'h0;
    parameter DEF_CFG_WTR_L_CRC_DM = 5'h00;
    parameter DEF_CFG_WTR_L = 4'h0;
    parameter DEF_CFG_WTR = 5'h06;
    parameter DEF_CFG_WRITE_TO_WRITE_ODT = 4'h0;
    parameter DEF_CFG_WRITE_TO_WRITE = 4'h0;
    parameter DEF_CFG_WRITE_TO_READ_ODT = 4'h1;
    parameter DEF_CFG_WRITE_TO_READ = 4'h1;
    parameter DEF_CFG_WRITE_DBI = 1'h0;
    parameter DEF_CFG_WRITE_CRC = 1'h0;
    parameter DEF_CFG_WR_PREAMBLE = 1'h0;
    parameter DEF_CFG_WR_CRC_DM = 6'h00;
    parameter DEF_CFG_WR_CMD_LAT_CRC_DM = 2'h0;
    parameter DEF_CFG_WR = 6'h0c;
    parameter DEF_CFG_WL = 6'h00;
    parameter DEF_CFG_VREFDQ_TRN_VALUE = 6'h00;
    parameter DEF_CFG_VREFDQ_TRN_RANGE = 1'h0;
    parameter DEF_CFG_VREFDQ_TRN_ENABLE = 1'h0;
    parameter DEF_CFG_TWO_T_SEL_CYCLE = 1'h0;
    parameter DEF_CFG_TWO_T = 1'h0;
    parameter DEF_CFG_TRIG_MODE = 1'h0;
    parameter DEF_CFG_TRIG_MASK = 3'h0;
    parameter DEF_CFG_TEMP_SENSOR_READOUT = 1'h0;
    parameter DEF_CFG_TEMP_CTRL_REF_RANGE = 1'h0;
    parameter DEF_CFG_TEMP_CTRL_REF_MODE = 1'h0;
    parameter DEF_CFG_TDQS = 1'h0;
    parameter DEF_CFG_STARVE_TIMEOUT_P7 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P6 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P5 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P4 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P3 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P2 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P1 = 12'h000;
    parameter DEF_CFG_STARVE_TIMEOUT_P0 = 12'h000;
    parameter DEF_CFG_PRE_TRIG_CYCS = 16'h0000;
    parameter DEF_CFG_STARTUP_DELAY = 19'h00010;
    parameter DEF_CFG_SRT = 1'h0;
    parameter DEF_CFG_SR_ABORT = 1'h0;
    parameter DEF_CFG_RTT_WR = 3'h0;
    parameter DEF_CFG_RTT_PARK = 3'h0;
    parameter DEF_CFG_RTT = 3'h0;
    parameter DEF_CFG_RTP = 5'h06;
    parameter DEF_CFG_RRD_S = 5'h00;
    parameter DEF_CFG_RRD_L = 5'h00;
    parameter DEF_CFG_RRD_DLR = 4'h0;
    parameter DEF_CFG_RRD = 5'h05;
    parameter DEF_CFG_RP = 6'h0a;
    parameter DEF_CFG_ROWADDR_MAP_3 = 24'h000000;
    parameter DEF_CFG_ROWADDR_MAP_2 = 28'h0000000;
    parameter DEF_CFG_ROWADDR_MAP_1 = 28'h0000000;
    parameter DEF_CFG_ROWADDR_MAP_0 = 28'h0000000;
    parameter DEF_CFG_RMW_EN = 1'h1;
    parameter DEF_CFG_RL = 6'h00;
    parameter DEF_CFG_RFC_DLR4 = 10'h000;
    parameter DEF_CFG_RFC_DLR2 = 10'h000;
    parameter DEF_CFG_RFC_DLR1 = 10'h000;
    parameter DEF_CFG_RFC4 = 10'h000;
    parameter DEF_CFG_RFC2 = 10'h000;
    parameter DEF_CFG_RFC1 = 10'h000;
    parameter DEF_CFG_RFC = 10'h058;
    parameter DEF_CFG_REGDIMM = 1'h0;
    parameter DEF_CFG_REF_PER = 16'h1860;
    parameter DEF_CFG_READ_TO_WRITE_ODT = 4'h1;
    parameter DEF_CFG_READ_TO_WRITE = 4'h1;
    parameter DEF_CFG_READ_TO_READ_ODT = 4'h1;
    parameter DEF_CFG_READ_TO_READ = 4'h1;
    parameter DEF_CFG_READ_DBI = 1'h0;
    parameter DEF_CFG_RDIMM_LAT = 3'h0;
    parameter DEF_CFG_RDIMM_BSIDE_INVERT = 1'h0;
    parameter DEF_CFG_RD_PREAMBLE = 1'h0;
    parameter DEF_CFG_RD_PREAMB_TRN_MODE = 1'h0;
    parameter DEF_CFG_RCD_STAB = 14'h0000;
    parameter DEF_CFG_RCD = 7'h0b;
    parameter DEF_CFG_RC = 8'h26;
    parameter DEF_CFG_RAS = 7'h1c;
    parameter DEF_CFG_QUAD_RANK = 1'h0;
    parameter DEF_CFG_QOFF = 1'h0;
    parameter DEF_CFG_POST_TRIG_CYCS = 7'h00;
    parameter DEF_CFG_PHYUPD_ACK_DELAY = 10'h000;
    parameter DEF_CFG_PER_DRAM_ADDR_EN = 1'h0;
    parameter DEF_CFG_PASR_SEG = 8'h00;
    parameter DEF_CFG_PASR_BANK = 8'h00;
    parameter DEF_CFG_PASR = 3'h0;
    parameter DEF_CFG_PARITY_RDIMM_DELAY = 1'h0;
    parameter DEF_CFG_ONLY_SRANK_CMDS = 1'h0;
    parameter DEF_CFG_ODT_WR_TURN_ON = 4'h0;
    parameter DEF_CFG_ODT_WR_TURN_OFF = 4'h0;
    parameter DEF_CFG_ODT_WR_MAP_CS7 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS6 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS5 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS4 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS3 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS2 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS1 = 8'h00;
    parameter DEF_CFG_ODT_WR_MAP_CS0 = 8'h00;
    parameter DEF_CFG_ODT_RD_TURN_ON = 4'h0;
    parameter DEF_CFG_ODT_RD_TURN_OFF = 4'h0;
    parameter DEF_CFG_ODT_RD_MAP_CS7 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS6 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS5 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS4 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS3 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS2 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS1 = 8'h00;
    parameter DEF_CFG_ODT_RD_MAP_CS0 = 8'h00;
    parameter DEF_CFG_ODT_POWERDOWN = 1'h0;
    parameter DEF_CFG_ODT_INBUF_4_PD = 1'h0;
    parameter DEF_CFG_NUM_RANKS = 5'h01;
    parameter DEF_CFG_NUM_LOGICAL_RANKS_PER_3DS = 4'h0;
    parameter DEF_CFG_NUM_CAL_READS = 2'h0;
    parameter DEF_CFG_NIBBLE_DEVICES = 1'h0;
    parameter DEF_CFG_MRW = 5'h00;
    parameter DEF_CFG_MRRI = 6'h00;
    parameter DEF_CFG_MRR = 4'h0;
    parameter DEF_CFG_MPR_READ_FORMAT = 2'h0;
    parameter DEF_CFG_MOD = 5'h0c;
    parameter DEF_CFG_MIRROR_X16_BG0_BG1 = 1'h0;
    parameter DEF_CFG_MIN_READ_IDLE = 3'h1;
    parameter DEF_CFG_MEMORY_TYPE = 16'h0008;
    parameter DEF_CFG_MEM_ROWBITS = 5'h10;
    parameter DEF_CFG_MEM_COLBITS = 4'hb;
    parameter DEF_CFG_MEM_BANKBITS = 3'h3;
    parameter DEF_CFG_MB_AUTOPCH_COL_BIT_POS_LOW = 3'h0;
    parameter DEF_CFG_MB_AUTOPCH_COL_BIT_POS_HIGH = 4'h0;
    parameter DEF_CFG_MAX_PWR_DOWN_MODE = 1'h0;
    parameter DEF_CFG_MANUAL_ADDRESS_MAP = 1'h0;
    parameter DEF_CFG_LRDIMM = 1'h0;
    parameter DEF_CFG_LP_ASR = 2'h0;
    parameter DEF_CFG_LOOKAHEAD_PCH = 1'h0;
    parameter DEF_CFG_LOOKAHEAD_ACT = 1'h0;
    parameter DEF_CFG_INT_VREF_MON = 1'h0;
    parameter DEF_CFG_INIT_DURATION = 16'h0000;
    parameter DEF_CFG_IDLE_TIME_TO_SELF_REFRESH = 32'h00000000;
    parameter DEF_CFG_IDLE_TIME_TO_POWER_DOWN = 32'h00000000;
    parameter DEF_CFG_GEARDOWN_MODE = 1'h0;
    parameter DEF_CFG_FINE_GRAN_REF_MODE = 3'h0;
    parameter DEF_CFG_FAW_DLR = 7'h00;
    parameter DEF_CFG_FAW = 9'h020;
    parameter DEF_CFG_ERROR_GROUP_SEL = 1'h0;
    parameter DEF_CFG_EN_MASK = 2'h0;
    parameter DEF_CFG_EMR3 = 16'h0000;
    parameter DEF_CFG_ECC_CORRECTION_EN = 1'h0;
    parameter DEF_CFG_EARLY_RANK_TO_WR_START = 3'h0;
    parameter DEF_CFG_EARLY_RANK_TO_RD_START = 3'h0;
    parameter DEF_CFG_DS = 4'h0;
    parameter DEF_CFG_DRAM_CLK_DISABLE_IN_SELF_REFRESH = 1'h0;
    parameter DEF_CFG_DM_EN = 1'h1;
    parameter DEF_CFG_DLL_DISABLE = 1'h0;
    parameter DEF_CFG_DFI_T_RDDATA_EN = 6'h24;
    parameter DEF_CFG_DFI_T_RDDATA_EN_SIM = 6'h24;
    parameter DEF_CFG_DFI_T_PHY_WRLAT = 6'h0b;
    parameter DEF_CFG_DFI_T_PHY_WRLAT_SIM = 6'h0b;
    parameter DEF_CFG_DFI_T_PHY_RDLAT = 5'h05;
    parameter DEF_CFG_DFI_T_DRAM_CLK_ENABLE = 8'h00;
    parameter DEF_CFG_DFI_T_CTRLUPD_MAX = 10'h000;
    parameter DEF_CFG_DFI_T_CTRL_DELAY = 8'h00;
    parameter DEF_CFG_DFI_PHYUPD_EN = 1'h0;
    parameter DEF_CFG_DFI_LVL_SEL = 1'h0;
    parameter DEF_CFG_DFI_LVL_PERIODIC = 1'h0;
    parameter DEF_CFG_DFI_LVL_PATTERN = 4'h0;
    parameter DEF_CFG_DFI_DATA_BYTE_DISABLE = 4'h0;
    parameter DEF_CFG_DATA_SEL = 7'h00;
    parameter DEF_CFG_DATA_SEL_FIRST_ERROR = 1'h0;
    parameter DEF_CFG_DATA_MASK = 1'h1;
    parameter DEF_CFG_CWL = 5'h08;
    parameter DEF_CFG_CTRLUPD_TRIG = 3'h0;
    parameter DEF_CFG_CTRLUPD_START_DELAY = 10'h000;
    parameter DEF_CFG_CTRLR_INIT_DISABLE = 1'h0;
    parameter DEF_CFG_CTRLR_BUSY_VALUE = 1'h0;
    parameter DEF_CFG_CTRLR_BUSY_TURN_OFF_DELAY = 9'h000;
    parameter DEF_CFG_CTRLR_BUSY_SLOW_RESTART_WINDOW = 7'h00;
    parameter DEF_CFG_CTRLR_BUSY_SEL = 1'h0;
    parameter DEF_CFG_CTRLR_BUSY_RESTART_HOLDOFF = 7'h00;
    parameter DEF_CFG_CTRLR_BUSY_ENABLE = 1'h0;
    parameter DEF_CFG_CS_TO_CMDADDR_LATENCY = 3'h0;
    parameter DEF_CFG_CRC_ERROR_CLEAR = 1'h0;
    parameter DEF_CFG_COLADDR_MAP_3 = 12'h000;
    parameter DEF_CFG_COLADDR_MAP_2 = 28'h0000000;
    parameter DEF_CFG_COLADDR_MAP_1 = 28'h0000000;
    parameter DEF_CFG_COLADDR_MAP_0 = 28'h0000000;
    parameter DEF_CFG_CL = 6'h0a;
    parameter DEF_CFG_CKSRX = 5'h00;
    parameter DEF_CFG_CKSRE = 5'h00;
    parameter DEF_CFG_CIDADDR_MAP = 18'h00000;
    parameter DEF_CFG_CHIPADDR_MAP = 24'h000000;
    parameter DEF_CFG_CCD_S = 3'h0;
    parameter DEF_CFG_CCD_L = 4'h0;
    parameter DEF_CFG_CAL_READ_PERIOD = 22'h000000;
    parameter DEF_CFG_CA_PARITY_PERSIST_ERR = 1'h0;
    parameter DEF_CFG_CA_PARITY_LATENCY = 3'h0;
    parameter DEF_CFG_CA_PARITY_ERR_STATUS = 1'h0;
    parameter DEF_CFG_BURST_RW_REFRESH_HOLDOFF = 1'h0;
    parameter DEF_CFG_BT = 1'h0;
    parameter DEF_CFG_BL_MODE = 2'h0;
    parameter DEF_CFG_BL = 2'h0;
    parameter DEF_CFG_BIT_MAP_INDEX_CS9 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS8 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS7 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS6 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS5 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS4 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS3 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS2 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS15 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS14 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS13 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS12 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS11 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS10 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS1 = 48'h000000000000;
    parameter DEF_CFG_BIT_MAP_INDEX_CS0 = 48'h000000000000;
    parameter DEF_CFG_BG_INTERLEAVE = 1'h0;
    parameter DEF_CFG_BANKADDR_MAP = 36'h000000000;
    parameter DEF_CFG_AUTO_ZQ_CAL_EN = 1'h1;
    parameter DEF_CFG_AUTO_SR = 1'h0;
    parameter DEF_CFG_AUTO_REF_EN = 1'h0;
    parameter DEF_CFG_ASYNC_ODT = 1'h0;
    parameter DEF_CFG_AL_MODE = 2'h0;
    parameter DEF_CFG_ADDR_MIRROR = 8'h00;
    parameter DEF_AXI0_CFG_AXI_START_ADDRESS = 32'h00000200;
    parameter DEF_AXI0_CFG_AXI_END_ADDRESS = 32'h00FFFFF;
    parameter DEF_AXI0_CFG_MEM_START_ADDRESS = 32'h00000000;
    parameter DEF_AXI0_CFG_ENABLE_BUS_HOLD = 1'h1;
    parameter DEF_PHY_TRAIN_STEP_ENABLE = 6'h18;
    parameter DEF_PHY_TRAIN_STEP_ENABLE_SIM = 6'h0;

    parameter DEF_ADDR_WAIT_COUNT = 0;
    parameter DEF_WRCAL_WRITE_COUNTER_VALUE = 0;
    parameter DEF_RDGATE_MIN_READS_THRESHOLD = 0;
    parameter DEF_PHY_GATE_TRAIN_DELAY = 0;
    parameter DEF_PHY_EYE_TRAIN_DELAY = 0;

    parameter DEF_ADDR_WAIT_COUNT_SIM = 0;
    parameter DEF_WRCAL_WRITE_COUNTER_VALUE_SIM = 0;
    parameter DEF_RDGATE_MIN_READS_THRESHOLD_SIM = 0;
    parameter DEF_PHY_GATE_TRAIN_DELAY_SIM = 0;
    parameter DEF_PHY_EYE_TRAIN_DELAY_SIM = 0;

    parameter FAST_TRAINING_SIMULTION = 0;

    parameter DEF_ADDR_VCOPHS_OFFSET = 0;
    parameter DEF_ADDR_VCOPHS_OFFSET_SIM = 0;

    output [11:0] cfg_zqinit_cal_duration;
    output [1:0] cfg_zq_cal_type;
    output [10:0] cfg_zq_cal_s_duration;
    output [10:0] cfg_zq_cal_r_duration;
    output [31:0] cfg_zq_cal_per;
    output [10:0] cfg_zq_cal_l_duration;
    output [8:0] cfg_xsr;
    output [10:0] cfg_xsdll;
    output [8:0] cfg_xs;
    output [9:0] cfg_xpr;
    output [4:0] cfg_xp;
    output [3:0] cfg_wtr_s_crc_dm;
    output [2:0] cfg_wtr_s;
    output [4:0] cfg_wtr_l_crc_dm;
    output [3:0] cfg_wtr_l;
    output [4:0] cfg_wtr;
    output [3:0] cfg_write_to_write_odt;
    output [3:0] cfg_write_to_write;
    output [3:0] cfg_write_to_read_odt;
    output [3:0] cfg_write_to_read;
    output cfg_write_dbi;
    output cfg_write_crc;
    output cfg_wr_preamble;
    output [5:0] cfg_wr_crc_dm;
    output [1:0] cfg_wr_cmd_lat_crc_dm;
    output [5:0] cfg_wr;
    output [5:0] cfg_wl;
    output [5:0] cfg_vrefdq_trn_value;
    output cfg_vrefdq_trn_range;
    output cfg_vrefdq_trn_enable;
    output cfg_two_t_sel_cycle;
    output cfg_two_t;
    output cfg_trig_mode;
    output [2:0] cfg_trig_mask;
    output cfg_temp_sensor_readout;
    output cfg_temp_ctrl_ref_range;
    output cfg_temp_ctrl_ref_mode;
    output cfg_tdqs;
    output [11:0] cfg_starve_timeout_p7;
    output [11:0] cfg_starve_timeout_p6;
    output [11:0] cfg_starve_timeout_p5;
    output [11:0] cfg_starve_timeout_p4;
    output [11:0] cfg_starve_timeout_p3;
    output [11:0] cfg_starve_timeout_p2;
    output [11:0] cfg_starve_timeout_p1;
    output [11:0] cfg_starve_timeout_p0;
    output [15:0] cfg_pre_trig_cycs;
    output [18:0] cfg_startup_delay;
    output cfg_srt;
    output cfg_sr_abort;
    output [2:0] cfg_rtt_wr;
    output [2:0] cfg_rtt_park;
    output [2:0] cfg_rtt;
    output [4:0] cfg_rtp;
    output [4:0] cfg_rrd_s;
    output [4:0] cfg_rrd_l;
    output [3:0] cfg_rrd_dlr;
    output [4:0] cfg_rrd;
    output [5:0] cfg_rp;
    output [107:0] cfg_rowaddr_map;
    output cfg_rmw_en;
    output [5:0] cfg_rl;
    output [9:0] cfg_rfc_dlr4;
    output [9:0] cfg_rfc_dlr2;
    output [9:0] cfg_rfc_dlr1;
    output [9:0] cfg_rfc4;
    output [9:0] cfg_rfc2;
    output [9:0] cfg_rfc1;
    output [9:0] cfg_rfc;
    output cfg_regdimm;
    output [15:0] cfg_ref_per;
    output [3:0] cfg_read_to_write_odt;
    output [3:0] cfg_read_to_write;
    output [3:0] cfg_read_to_read_odt;
    output [3:0] cfg_read_to_read;
    output cfg_read_dbi;
    output [2:0] cfg_rdimm_lat;
    output cfg_rdimm_bside_invert;
    output cfg_rd_preamble;
    output cfg_rd_preamb_trn_mode;
    output [13:0] cfg_rcd_stab;
    output [6:0] cfg_rcd;
    output [7:0] cfg_rc;
    output [6:0] cfg_ras;
    output cfg_quad_rank;
    output cfg_qoff;
    output [6:0] cfg_post_trig_cycs;
    output [9:0] cfg_phyupd_ack_delay;
    output cfg_per_dram_addr_en;
    output [7:0] cfg_pasr_seg;
    output [7:0] cfg_pasr_bank;
    output [2:0] cfg_pasr;
    output cfg_parity_rdimm_delay;
    output cfg_only_srank_cmds;
    output [3:0] cfg_odt_wr_turn_on;
    output [3:0] cfg_odt_wr_turn_off;
    output [7:0] cfg_odt_wr_map_cs7;
    output [7:0] cfg_odt_wr_map_cs6;
    output [7:0] cfg_odt_wr_map_cs5;
    output [7:0] cfg_odt_wr_map_cs4;
    output [7:0] cfg_odt_wr_map_cs3;
    output [7:0] cfg_odt_wr_map_cs2;
    output [7:0] cfg_odt_wr_map_cs1;
    output [7:0] cfg_odt_wr_map_cs0;
    output [3:0] cfg_odt_rd_turn_on;
    output [3:0] cfg_odt_rd_turn_off;
    output [7:0] cfg_odt_rd_map_cs7;
    output [7:0] cfg_odt_rd_map_cs6;
    output [7:0] cfg_odt_rd_map_cs5;
    output [7:0] cfg_odt_rd_map_cs4;
    output [7:0] cfg_odt_rd_map_cs3;
    output [7:0] cfg_odt_rd_map_cs2;
    output [7:0] cfg_odt_rd_map_cs1;
    output [7:0] cfg_odt_rd_map_cs0;
    output cfg_odt_powerdown;
    output cfg_odt_inbuf_4_pd;
    output [4:0] cfg_num_ranks;
    output [3:0] cfg_num_logical_ranks_per_3ds;
    output [1:0] cfg_num_cal_reads;
    output cfg_nibble_devices;
    output [4:0] cfg_mrw;
    output [5:0] cfg_mrri;
    output [3:0] cfg_mrr;
    output [1:0] cfg_mpr_read_format;
    output [4:0] cfg_mod;
    output cfg_mirror_x16_bg0_bg1;
    output [2:0] cfg_min_read_idle;
    output [15:0] cfg_memory_type;
    output [4:0] cfg_mem_rowbits;
    output [3:0] cfg_mem_colbits;
    output [2:0] cfg_mem_bankbits;
    output [2:0] cfg_mb_autopch_col_bit_pos_low;
    output [3:0] cfg_mb_autopch_col_bit_pos_high;
    output cfg_max_pwr_down_mode;
    output cfg_manual_address_map;
    output cfg_lrdimm;
    output [1:0] cfg_lp_asr;
    output cfg_lookahead_pch;
    output cfg_lookahead_act;
    output cfg_int_vref_mon;
    output [15:0] cfg_init_duration;
    output [31:0] cfg_idle_time_to_self_refresh;
    output [31:0] cfg_idle_time_to_power_down;
    output cfg_geardown_mode;
    output [2:0] cfg_fine_gran_ref_mode;
    output [6:0] cfg_faw_dlr;
    output [8:0] cfg_faw;
    output cfg_error_group_sel;
    output [1:0] cfg_en_mask;
    output [15:0] cfg_emr3;
    output cfg_ecc_correction_en;
    output [2:0] cfg_early_rank_to_wr_start;
    output [2:0] cfg_early_rank_to_rd_start;
    output [3:0] cfg_ds;
    output cfg_dram_clk_disable_in_self_refresh;
    output cfg_dm_en;
    output cfg_dll_disable;
    output [5:0] cfg_dfi_t_rddata_en;
    output [5:0] cfg_dfi_t_phy_wrlat;
    output [4:0] cfg_dfi_t_phy_rdlat;
    output [7:0] cfg_dfi_t_dram_clk_enable;
    output [9:0] cfg_dfi_t_ctrlupd_max;
    output [7:0] cfg_dfi_t_ctrl_delay;
    output cfg_dfi_phyupd_en;
    output cfg_dfi_lvl_sel;
    output cfg_dfi_lvl_periodic;
    output [3:0] cfg_dfi_lvl_pattern;
    output [8:0] cfg_dfi_data_byte_disable;
    output [6:0] cfg_data_sel;
    output cfg_data_sel_first_error;
    output cfg_data_mask;
    output [4:0] cfg_cwl;
    output [2:0] cfg_ctrlupd_trig;
    output [9:0] cfg_ctrlupd_start_delay;
    output cfg_ctrlr_init_disable;
    output cfg_ctrlr_busy_value;
    output [8:0] cfg_ctrlr_busy_turn_off_delay;
    output [6:0] cfg_ctrlr_busy_slow_restart_window;
    output cfg_ctrlr_busy_sel;
    output [6:0] cfg_ctrlr_busy_restart_holdoff;
    output cfg_ctrlr_busy_enable;
    output [2:0] cfg_cs_to_cmdaddr_latency;
    output cfg_crc_error_clear;
    output [95:0] cfg_coladdr_map;
    output [5:0] cfg_cl;
    output [4:0] cfg_cksrx;
    output [4:0] cfg_cksre;
    output [17:0] cfg_cidaddr_map;
    output [23:0] cfg_chipaddr_map;
    output [2:0] cfg_ccd_s;
    output [3:0] cfg_ccd_l;
    output [21:0] cfg_cal_read_period;
    output cfg_ca_parity_persist_err;
    output [2:0] cfg_ca_parity_latency;
    output cfg_ca_parity_err_status;
    output cfg_burst_rw_refresh_holdoff;
    output cfg_bt;
    output [1:0] cfg_bl_mode;
    output [1:0] cfg_bl;
    output [107:0] cfg_bit_map_index_cs9;
    output [107:0] cfg_bit_map_index_cs8;
    output [107:0] cfg_bit_map_index_cs7;
    output [107:0] cfg_bit_map_index_cs6;
    output [107:0] cfg_bit_map_index_cs5;
    output [107:0] cfg_bit_map_index_cs4;
    output [107:0] cfg_bit_map_index_cs3;
    output [107:0] cfg_bit_map_index_cs2;
    output [107:0] cfg_bit_map_index_cs15;
    output [107:0] cfg_bit_map_index_cs14;
    output [107:0] cfg_bit_map_index_cs13;
    output [107:0] cfg_bit_map_index_cs12;
    output [107:0] cfg_bit_map_index_cs11;
    output [107:0] cfg_bit_map_index_cs10;
    output [107:0] cfg_bit_map_index_cs1;
    output [107:0] cfg_bit_map_index_cs0;
    output cfg_bg_interleave;
    output [35:0] cfg_bankaddr_map;
    output cfg_auto_zq_cal_en;
    output cfg_auto_sr;
    output cfg_auto_ref_en;
    output cfg_async_odt;
    output [1:0] cfg_al_mode;
    output [7:0] cfg_addr_mirror;
    output [31:0] axi0_cfg_axi_start_address;
    output [31:0] axi0_cfg_axi_end_address;
    output [31:0] axi0_cfg_mem_start_address;
    output axi0_cfg_enable_bus_hold;
    output [5:0] phy_train_step_enable;

    output [9:0] ADDR_WAIT_COUNT;
    output [7:0] WRCAL_WRITE_COUNTER_VALUE;
    output [9:0] RDGATE_MIN_READS_THRESHOLD;
    output [5:0] phy_gate_train_delay;
    output [5:0] phy_eye_train_delay;

    output [2:0] ADDR_VCOPHS_OFFSET;


    wire [18:0] cfg_startup_delay_int;
    wire [5:0] cfg_dfi_t_phy_wrlat_int;
    wire [5:0] phy_train_step_enable_int;
    wire [5:0] cfg_dfi_t_rddata_en_int;

    wire [9:0] ADDR_WAIT_COUNT_int;
    wire [7:0] WRCAL_WRITE_COUNTER_VALUE_int;
    wire [9:0] RDGATE_MIN_READS_THRESHOLD_int;
    wire [5:0] phy_gate_train_delay_int;
    wire [5:0] phy_eye_train_delay_int;

    /* synthesis translate_off */
    generate
        if ( SKIP_STARTUP_DELAY_SIMULATION )
            assign cfg_startup_delay_int = 10;
        else
    /* synthesis translate_on */
            assign cfg_startup_delay_int = DEF_CFG_STARTUP_DELAY;
    /* synthesis translate_off */
    endgenerate
    /* synthesis translate_on */

    /* synthesis translate_off */
    generate
        if ( SKIP_TRAINING_SIMULATION ) begin
            assign phy_train_step_enable_int = DEF_PHY_TRAIN_STEP_ENABLE_SIM;
            assign ADDR_WAIT_COUNT_int = DEF_ADDR_WAIT_COUNT_SIM ;
            assign WRCAL_WRITE_COUNTER_VALUE_int = DEF_WRCAL_WRITE_COUNTER_VALUE_SIM ;
            assign RDGATE_MIN_READS_THRESHOLD_int = DEF_RDGATE_MIN_READS_THRESHOLD_SIM ;
            assign phy_gate_train_delay_int = DEF_PHY_GATE_TRAIN_DELAY_SIM ;
            assign phy_eye_train_delay_int = DEF_PHY_EYE_TRAIN_DELAY_SIM ;
        end else if ( FAST_TRAINING_SIMULTION ) begin
        	assign phy_train_step_enable_int = DEF_PHY_TRAIN_STEP_ENABLE;
            assign ADDR_WAIT_COUNT_int = DEF_ADDR_WAIT_COUNT_SIM ;
            assign WRCAL_WRITE_COUNTER_VALUE_int = DEF_WRCAL_WRITE_COUNTER_VALUE_SIM ;
            assign RDGATE_MIN_READS_THRESHOLD_int = DEF_RDGATE_MIN_READS_THRESHOLD_SIM ;
            assign phy_gate_train_delay_int = DEF_PHY_GATE_TRAIN_DELAY_SIM ;
            assign phy_eye_train_delay_int = DEF_PHY_EYE_TRAIN_DELAY_SIM ;
        end else begin
    /* synthesis translate_on */
            assign phy_train_step_enable_int = DEF_PHY_TRAIN_STEP_ENABLE;
            assign ADDR_WAIT_COUNT_int = DEF_ADDR_WAIT_COUNT ;
            assign WRCAL_WRITE_COUNTER_VALUE_int = DEF_WRCAL_WRITE_COUNTER_VALUE ;
            assign RDGATE_MIN_READS_THRESHOLD_int = DEF_RDGATE_MIN_READS_THRESHOLD ;
            assign phy_gate_train_delay_int = DEF_PHY_GATE_TRAIN_DELAY ;
            assign phy_eye_train_delay_int = DEF_PHY_EYE_TRAIN_DELAY ;
    /* synthesis translate_off */
        end
    endgenerate
    /* synthesis translate_on */

    /* synthesis translate_off */
    generate
        if ( 1 ) begin
            assign cfg_dfi_t_phy_wrlat_int = DEF_CFG_DFI_T_PHY_WRLAT_SIM;
            assign cfg_dfi_t_rddata_en_int = DEF_CFG_DFI_T_RDDATA_EN_SIM;
        end else begin
    /* synthesis translate_on */
            assign cfg_dfi_t_phy_wrlat_int = DEF_CFG_DFI_T_PHY_WRLAT;
            assign cfg_dfi_t_rddata_en_int = DEF_CFG_DFI_T_RDDATA_EN;
    /* synthesis translate_off */
        end
    endgenerate
    /* synthesis translate_on */

        /* synthesis translate_off */
    generate
        if ( 1 ) begin
            assign ADDR_VCOPHS_OFFSET = DEF_ADDR_VCOPHS_OFFSET_SIM;
        end else begin
    /* synthesis translate_on */
            assign ADDR_VCOPHS_OFFSET = DEF_ADDR_VCOPHS_OFFSET;
    /* synthesis translate_off */
        end
    endgenerate
    /* synthesis translate_on */

    
    

    assign cfg_startup_delay = cfg_startup_delay_int;
    assign cfg_dfi_t_phy_wrlat = cfg_dfi_t_phy_wrlat_int;
    assign phy_train_step_enable = phy_train_step_enable_int;
    assign cfg_dfi_t_rddata_en = cfg_dfi_t_rddata_en_int;

    assign ADDR_WAIT_COUNT = ADDR_WAIT_COUNT_int;
    assign WRCAL_WRITE_COUNTER_VALUE = WRCAL_WRITE_COUNTER_VALUE_int;
    assign RDGATE_MIN_READS_THRESHOLD = RDGATE_MIN_READS_THRESHOLD_int;
    assign phy_gate_train_delay = phy_gate_train_delay_int;
    assign phy_eye_train_delay = phy_eye_train_delay_int;

    assign cfg_zqinit_cal_duration = DEF_CFG_ZQINIT_CAL_DURATION;
    assign cfg_zq_cal_type = DEF_CFG_ZQ_CAL_TYPE;
    assign cfg_zq_cal_s_duration = DEF_CFG_ZQ_CAL_S_DURATION;
    assign cfg_zq_cal_r_duration = DEF_CFG_ZQ_CAL_R_DURATION;
    assign cfg_zq_cal_per = DEF_CFG_ZQ_CAL_PER;
    assign cfg_zq_cal_l_duration = DEF_CFG_ZQ_CAL_L_DURATION;
    assign cfg_xsr = DEF_CFG_XSR;
    assign cfg_xsdll = DEF_CFG_XSDLL;
    assign cfg_xs = DEF_CFG_XS;
    assign cfg_xpr = DEF_CFG_XPR;
    assign cfg_xp = DEF_CFG_XP;
    assign cfg_wtr_s_crc_dm = DEF_CFG_WTR_S_CRC_DM;
    assign cfg_wtr_s = DEF_CFG_WTR_S;
    assign cfg_wtr_l_crc_dm = DEF_CFG_WTR_L_CRC_DM;
    assign cfg_wtr_l = DEF_CFG_WTR_L;
    assign cfg_wtr = DEF_CFG_WTR;
    assign cfg_write_to_write_odt = DEF_CFG_WRITE_TO_WRITE_ODT;
    assign cfg_write_to_write = DEF_CFG_WRITE_TO_WRITE;
    assign cfg_write_to_read_odt = DEF_CFG_WRITE_TO_READ_ODT;
    assign cfg_write_to_read = DEF_CFG_WRITE_TO_READ;
    assign cfg_write_dbi = DEF_CFG_WRITE_DBI;
    assign cfg_write_crc = DEF_CFG_WRITE_CRC;
    assign cfg_wr_preamble = DEF_CFG_WR_PREAMBLE;
    assign cfg_wr_crc_dm = DEF_CFG_WR_CRC_DM;
    assign cfg_wr_cmd_lat_crc_dm = DEF_CFG_WR_CMD_LAT_CRC_DM;
    assign cfg_wr = DEF_CFG_WR;
    assign cfg_wl = DEF_CFG_WL;
    assign cfg_vrefdq_trn_value = DEF_CFG_VREFDQ_TRN_VALUE;
    assign cfg_vrefdq_trn_range = DEF_CFG_VREFDQ_TRN_RANGE;
    assign cfg_vrefdq_trn_enable = DEF_CFG_VREFDQ_TRN_ENABLE;
    assign cfg_two_t_sel_cycle = DEF_CFG_TWO_T_SEL_CYCLE;
    assign cfg_two_t = DEF_CFG_TWO_T;
    assign cfg_trig_mode = DEF_CFG_TRIG_MODE;
    assign cfg_trig_mask = DEF_CFG_TRIG_MASK;
    assign cfg_temp_sensor_readout = DEF_CFG_TEMP_SENSOR_READOUT;
    assign cfg_temp_ctrl_ref_range = DEF_CFG_TEMP_CTRL_REF_RANGE;
    assign cfg_temp_ctrl_ref_mode = DEF_CFG_TEMP_CTRL_REF_MODE;
    assign cfg_tdqs = DEF_CFG_TDQS;
    assign cfg_starve_timeout_p7 = DEF_CFG_STARVE_TIMEOUT_P7;
    assign cfg_starve_timeout_p6 = DEF_CFG_STARVE_TIMEOUT_P6;
    assign cfg_starve_timeout_p5 = DEF_CFG_STARVE_TIMEOUT_P5;
    assign cfg_starve_timeout_p4 = DEF_CFG_STARVE_TIMEOUT_P4;
    assign cfg_starve_timeout_p3 = DEF_CFG_STARVE_TIMEOUT_P3;
    assign cfg_starve_timeout_p2 = DEF_CFG_STARVE_TIMEOUT_P2;
    assign cfg_starve_timeout_p1 = DEF_CFG_STARVE_TIMEOUT_P1;
    assign cfg_starve_timeout_p0 = DEF_CFG_STARVE_TIMEOUT_P0;
    assign cfg_pre_trig_cycs = DEF_CFG_PRE_TRIG_CYCS;    
    assign cfg_srt = DEF_CFG_SRT;
    assign cfg_sr_abort = DEF_CFG_SR_ABORT;
    assign cfg_rtt_wr = DEF_CFG_RTT_WR;
    assign cfg_rtt_park = DEF_CFG_RTT_PARK;
    assign cfg_rtt = DEF_CFG_RTT;
    assign cfg_rtp = DEF_CFG_RTP;
    assign cfg_rrd_s = DEF_CFG_RRD_S;
    assign cfg_rrd_l = DEF_CFG_RRD_L;
    assign cfg_rrd_dlr = DEF_CFG_RRD_DLR;
    assign cfg_rrd = DEF_CFG_RRD;
    assign cfg_rp = DEF_CFG_RP;
    assign cfg_rowaddr_map = (DEF_CFG_ROWADDR_MAP_3 << 84) | (DEF_CFG_ROWADDR_MAP_2 << 56) | (DEF_CFG_ROWADDR_MAP_1 << 28) | (DEF_CFG_ROWADDR_MAP_0);
    assign cfg_rmw_en = DEF_CFG_RMW_EN;
    assign cfg_rl = DEF_CFG_RL;
    assign cfg_rfc_dlr4 = DEF_CFG_RFC_DLR4;
    assign cfg_rfc_dlr2 = DEF_CFG_RFC_DLR2;
    assign cfg_rfc_dlr1 = DEF_CFG_RFC_DLR1;
    assign cfg_rfc4 = DEF_CFG_RFC4;
    assign cfg_rfc2 = DEF_CFG_RFC2;
    assign cfg_rfc1 = DEF_CFG_RFC1;
    assign cfg_rfc = DEF_CFG_RFC;
    assign cfg_regdimm = DEF_CFG_REGDIMM;
    assign cfg_ref_per = DEF_CFG_REF_PER;
    assign cfg_read_to_write_odt = DEF_CFG_READ_TO_WRITE_ODT;
    assign cfg_read_to_write = DEF_CFG_READ_TO_WRITE;
    assign cfg_read_to_read_odt = DEF_CFG_READ_TO_READ_ODT;
    assign cfg_read_to_read = DEF_CFG_READ_TO_READ;
    assign cfg_read_dbi = DEF_CFG_READ_DBI;
    assign cfg_rdimm_lat = DEF_CFG_RDIMM_LAT;
    assign cfg_rdimm_bside_invert = DEF_CFG_RDIMM_BSIDE_INVERT;
    assign cfg_rd_preamble = DEF_CFG_RD_PREAMBLE;
    assign cfg_rd_preamb_trn_mode = DEF_CFG_RD_PREAMB_TRN_MODE;
    assign cfg_rcd_stab = DEF_CFG_RCD_STAB;
    assign cfg_rcd = DEF_CFG_RCD;
    assign cfg_rc = DEF_CFG_RC;
    assign cfg_ras = DEF_CFG_RAS;
    assign cfg_quad_rank = DEF_CFG_QUAD_RANK;
    assign cfg_qoff = DEF_CFG_QOFF;
    assign cfg_post_trig_cycs = DEF_CFG_POST_TRIG_CYCS;
    assign cfg_phyupd_ack_delay = DEF_CFG_PHYUPD_ACK_DELAY;
    assign cfg_per_dram_addr_en = DEF_CFG_PER_DRAM_ADDR_EN;
    assign cfg_pasr_seg = DEF_CFG_PASR_SEG;
    assign cfg_pasr_bank = DEF_CFG_PASR_BANK;
    assign cfg_pasr = DEF_CFG_PASR;
    assign cfg_parity_rdimm_delay = DEF_CFG_PARITY_RDIMM_DELAY;
    assign cfg_only_srank_cmds = DEF_CFG_ONLY_SRANK_CMDS;
    assign cfg_odt_wr_turn_on = DEF_CFG_ODT_WR_TURN_ON;
    assign cfg_odt_wr_turn_off = DEF_CFG_ODT_WR_TURN_OFF;
    assign cfg_odt_wr_map_cs7 = DEF_CFG_ODT_WR_MAP_CS7;
    assign cfg_odt_wr_map_cs6 = DEF_CFG_ODT_WR_MAP_CS6;
    assign cfg_odt_wr_map_cs5 = DEF_CFG_ODT_WR_MAP_CS5;
    assign cfg_odt_wr_map_cs4 = DEF_CFG_ODT_WR_MAP_CS4;
    assign cfg_odt_wr_map_cs3 = DEF_CFG_ODT_WR_MAP_CS3;
    assign cfg_odt_wr_map_cs2 = DEF_CFG_ODT_WR_MAP_CS2;
    assign cfg_odt_wr_map_cs1 = DEF_CFG_ODT_WR_MAP_CS1;
    assign cfg_odt_wr_map_cs0 = DEF_CFG_ODT_WR_MAP_CS0;
    assign cfg_odt_rd_turn_on = DEF_CFG_ODT_RD_TURN_ON;
    assign cfg_odt_rd_turn_off = DEF_CFG_ODT_RD_TURN_OFF;
    assign cfg_odt_rd_map_cs7 = DEF_CFG_ODT_RD_MAP_CS7;
    assign cfg_odt_rd_map_cs6 = DEF_CFG_ODT_RD_MAP_CS6;
    assign cfg_odt_rd_map_cs5 = DEF_CFG_ODT_RD_MAP_CS5;
    assign cfg_odt_rd_map_cs4 = DEF_CFG_ODT_RD_MAP_CS4;
    assign cfg_odt_rd_map_cs3 = DEF_CFG_ODT_RD_MAP_CS3;
    assign cfg_odt_rd_map_cs2 = DEF_CFG_ODT_RD_MAP_CS2;
    assign cfg_odt_rd_map_cs1 = DEF_CFG_ODT_RD_MAP_CS1;
    assign cfg_odt_rd_map_cs0 = DEF_CFG_ODT_RD_MAP_CS0;
    assign cfg_odt_powerdown = DEF_CFG_ODT_POWERDOWN;
    assign cfg_odt_inbuf_4_pd = DEF_CFG_ODT_INBUF_4_PD;
    assign cfg_num_ranks = DEF_CFG_NUM_RANKS;
    assign cfg_num_logical_ranks_per_3ds = DEF_CFG_NUM_LOGICAL_RANKS_PER_3DS;
    assign cfg_num_cal_reads = DEF_CFG_NUM_CAL_READS;
    assign cfg_nibble_devices = DEF_CFG_NIBBLE_DEVICES;
    assign cfg_mrw = DEF_CFG_MRW;
    assign cfg_mrri = DEF_CFG_MRRI;
    assign cfg_mrr = DEF_CFG_MRR;
    assign cfg_mpr_read_format = DEF_CFG_MPR_READ_FORMAT;
    assign cfg_mod = DEF_CFG_MOD;
    assign cfg_mirror_x16_bg0_bg1 = DEF_CFG_MIRROR_X16_BG0_BG1;
    assign cfg_min_read_idle = DEF_CFG_MIN_READ_IDLE;
    assign cfg_memory_type = DEF_CFG_MEMORY_TYPE;
    assign cfg_mem_rowbits = DEF_CFG_MEM_ROWBITS;
    assign cfg_mem_colbits = DEF_CFG_MEM_COLBITS;
    assign cfg_mem_bankbits = DEF_CFG_MEM_BANKBITS;
    assign cfg_mb_autopch_col_bit_pos_low = DEF_CFG_MB_AUTOPCH_COL_BIT_POS_LOW;
    assign cfg_mb_autopch_col_bit_pos_high = DEF_CFG_MB_AUTOPCH_COL_BIT_POS_HIGH;
    assign cfg_max_pwr_down_mode = DEF_CFG_MAX_PWR_DOWN_MODE;
    assign cfg_manual_address_map = DEF_CFG_MANUAL_ADDRESS_MAP;
    assign cfg_lrdimm = DEF_CFG_LRDIMM;
    assign cfg_lp_asr = DEF_CFG_LP_ASR;
    assign cfg_lookahead_pch = DEF_CFG_LOOKAHEAD_PCH;
    assign cfg_lookahead_act = DEF_CFG_LOOKAHEAD_ACT;
    assign cfg_int_vref_mon = DEF_CFG_INT_VREF_MON;
    assign cfg_init_duration = DEF_CFG_INIT_DURATION;
    assign cfg_idle_time_to_self_refresh = DEF_CFG_IDLE_TIME_TO_SELF_REFRESH;
    assign cfg_idle_time_to_power_down = DEF_CFG_IDLE_TIME_TO_POWER_DOWN;
    assign cfg_geardown_mode = DEF_CFG_GEARDOWN_MODE;
    assign cfg_fine_gran_ref_mode = DEF_CFG_FINE_GRAN_REF_MODE;
    assign cfg_faw_dlr = DEF_CFG_FAW_DLR;
    assign cfg_faw = DEF_CFG_FAW;
    assign cfg_error_group_sel = DEF_CFG_ERROR_GROUP_SEL;
    assign cfg_en_mask = DEF_CFG_EN_MASK;
    assign cfg_emr3 = DEF_CFG_EMR3;
    assign cfg_ecc_correction_en = DEF_CFG_ECC_CORRECTION_EN;
    assign cfg_early_rank_to_wr_start = DEF_CFG_EARLY_RANK_TO_WR_START;
    assign cfg_early_rank_to_rd_start = DEF_CFG_EARLY_RANK_TO_RD_START;
    assign cfg_ds = DEF_CFG_DS;
    assign cfg_dram_clk_disable_in_self_refresh = DEF_CFG_DRAM_CLK_DISABLE_IN_SELF_REFRESH;
    assign cfg_dm_en = DEF_CFG_DM_EN;
    assign cfg_dll_disable = DEF_CFG_DLL_DISABLE;
    assign cfg_dfi_t_phy_rdlat = DEF_CFG_DFI_T_PHY_RDLAT;
    assign cfg_dfi_t_dram_clk_enable = DEF_CFG_DFI_T_DRAM_CLK_ENABLE;
    assign cfg_dfi_t_ctrlupd_max = DEF_CFG_DFI_T_CTRLUPD_MAX;
    assign cfg_dfi_t_ctrl_delay = DEF_CFG_DFI_T_CTRL_DELAY;
    assign cfg_dfi_phyupd_en = DEF_CFG_DFI_PHYUPD_EN;
    assign cfg_dfi_lvl_sel = DEF_CFG_DFI_LVL_SEL;
    assign cfg_dfi_lvl_periodic = DEF_CFG_DFI_LVL_PERIODIC;
    assign cfg_dfi_lvl_pattern = DEF_CFG_DFI_LVL_PATTERN;
    assign cfg_dfi_data_byte_disable = DEF_CFG_DFI_DATA_BYTE_DISABLE;
    assign cfg_data_sel = DEF_CFG_DATA_SEL;
    assign cfg_data_sel_first_error = DEF_CFG_DATA_SEL_FIRST_ERROR;
    assign cfg_data_mask = DEF_CFG_DATA_MASK;
    assign cfg_cwl = DEF_CFG_CWL;
    assign cfg_ctrlupd_trig = DEF_CFG_CTRLUPD_TRIG;
    assign cfg_ctrlupd_start_delay = DEF_CFG_CTRLUPD_START_DELAY;
    assign cfg_ctrlr_init_disable = DEF_CFG_CTRLR_INIT_DISABLE;
    assign cfg_ctrlr_busy_value = DEF_CFG_CTRLR_BUSY_VALUE;
    assign cfg_ctrlr_busy_turn_off_delay = DEF_CFG_CTRLR_BUSY_TURN_OFF_DELAY;
    assign cfg_ctrlr_busy_slow_restart_window = DEF_CFG_CTRLR_BUSY_SLOW_RESTART_WINDOW;
    assign cfg_ctrlr_busy_sel = DEF_CFG_CTRLR_BUSY_SEL;
    assign cfg_ctrlr_busy_restart_holdoff = DEF_CFG_CTRLR_BUSY_RESTART_HOLDOFF;
    assign cfg_ctrlr_busy_enable = DEF_CFG_CTRLR_BUSY_ENABLE;
    assign cfg_cs_to_cmdaddr_latency = DEF_CFG_CS_TO_CMDADDR_LATENCY;
    assign cfg_crc_error_clear = DEF_CFG_CRC_ERROR_CLEAR;
    assign cfg_coladdr_map = (DEF_CFG_COLADDR_MAP_3 << 84) | (DEF_CFG_COLADDR_MAP_2 << 56) | (DEF_CFG_COLADDR_MAP_1 << 28) | (DEF_CFG_COLADDR_MAP_0);
    assign cfg_cl = DEF_CFG_CL;
    assign cfg_cksrx = DEF_CFG_CKSRX;
    assign cfg_cksre = DEF_CFG_CKSRE;
    assign cfg_cidaddr_map = DEF_CFG_CIDADDR_MAP;
    assign cfg_chipaddr_map = DEF_CFG_CHIPADDR_MAP;
    assign cfg_ccd_s = DEF_CFG_CCD_S;
    assign cfg_ccd_l = DEF_CFG_CCD_L;
    assign cfg_cal_read_period = DEF_CFG_CAL_READ_PERIOD;
    assign cfg_ca_parity_persist_err = DEF_CFG_CA_PARITY_PERSIST_ERR;
    assign cfg_ca_parity_latency = DEF_CFG_CA_PARITY_LATENCY;
    assign cfg_ca_parity_err_status = DEF_CFG_CA_PARITY_ERR_STATUS;
    assign cfg_burst_rw_refresh_holdoff = DEF_CFG_BURST_RW_REFRESH_HOLDOFF;
    assign cfg_bt = DEF_CFG_BT;
    assign cfg_bl_mode = DEF_CFG_BL_MODE;
    assign cfg_bl = DEF_CFG_BL;
    assign cfg_bit_map_index_cs9 = DEF_CFG_BIT_MAP_INDEX_CS9;
    assign cfg_bit_map_index_cs8 = DEF_CFG_BIT_MAP_INDEX_CS8;
    assign cfg_bit_map_index_cs7 = DEF_CFG_BIT_MAP_INDEX_CS7;
    assign cfg_bit_map_index_cs6 = DEF_CFG_BIT_MAP_INDEX_CS6;
    assign cfg_bit_map_index_cs5 = DEF_CFG_BIT_MAP_INDEX_CS5;
    assign cfg_bit_map_index_cs4 = DEF_CFG_BIT_MAP_INDEX_CS4;
    assign cfg_bit_map_index_cs3 = DEF_CFG_BIT_MAP_INDEX_CS3;
    assign cfg_bit_map_index_cs2 = DEF_CFG_BIT_MAP_INDEX_CS2;
    assign cfg_bit_map_index_cs15 = DEF_CFG_BIT_MAP_INDEX_CS15;
    assign cfg_bit_map_index_cs14 = DEF_CFG_BIT_MAP_INDEX_CS14;
    assign cfg_bit_map_index_cs13 = DEF_CFG_BIT_MAP_INDEX_CS13;
    assign cfg_bit_map_index_cs12 = DEF_CFG_BIT_MAP_INDEX_CS12;
    assign cfg_bit_map_index_cs11 = DEF_CFG_BIT_MAP_INDEX_CS11;
    assign cfg_bit_map_index_cs10 = DEF_CFG_BIT_MAP_INDEX_CS10;
    assign cfg_bit_map_index_cs1 = DEF_CFG_BIT_MAP_INDEX_CS1;
    assign cfg_bit_map_index_cs0 = DEF_CFG_BIT_MAP_INDEX_CS0;
    assign cfg_bg_interleave = DEF_CFG_BG_INTERLEAVE;
    assign cfg_bankaddr_map = DEF_CFG_BANKADDR_MAP;
    assign cfg_auto_zq_cal_en = DEF_CFG_AUTO_ZQ_CAL_EN;
    assign cfg_auto_sr = DEF_CFG_AUTO_SR;
    assign cfg_auto_ref_en = DEF_CFG_AUTO_REF_EN;
    assign cfg_async_odt = DEF_CFG_ASYNC_ODT;
    assign cfg_al_mode = DEF_CFG_AL_MODE;
    assign cfg_addr_mirror = DEF_CFG_ADDR_MIRROR;

    assign axi0_cfg_axi_start_address = DEF_AXI0_CFG_AXI_START_ADDRESS;
    assign axi0_cfg_axi_end_address = DEF_AXI0_CFG_AXI_END_ADDRESS;
    assign axi0_cfg_mem_start_address = DEF_AXI0_CFG_MEM_START_ADDRESS;
    assign axi0_cfg_enable_bus_hold = DEF_AXI0_CFG_ENABLE_BUS_HOLD;

endmodule
