set_component PF_IOD_GENERIC_RX_C1_PF_CLK_DIV_RXCLK_PF_CLK_DIV_DELAY
create_generated_clock -source [ get_pins I_CDD/A ] -multiply_by 1 -divide_by 4 [ get_pins I_CDD/Y_DIV ]
