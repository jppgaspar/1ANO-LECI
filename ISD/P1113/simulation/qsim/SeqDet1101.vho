-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "01/22/2022 18:50:52"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SeqDet1101 IS
    PORT (
	Y : OUT std_logic;
	X : IN std_logic;
	CLK : IN std_logic
	);
END SeqDet1101;

ARCHITECTURE structure OF SeqDet1101 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y : std_logic;
SIGNAL ww_X : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL \Y~output_o\ : std_logic;
SIGNAL \X~input_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \Q0~q\ : std_logic;
SIGNAL \inst9~0_combout\ : std_logic;
SIGNAL \Q1~q\ : std_logic;
SIGNAL \inst17~0_combout\ : std_logic;

BEGIN

Y <= ww_Y;
ww_X <= X;
ww_CLK <= CLK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Y~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst17~0_combout\,
	devoe => ww_devoe,
	o => \Y~output_o\);

\X~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X,
	o => \X~input_o\);

\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

Q0 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \X~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q0~q\);

\inst9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9~0_combout\ = (\Q0~q\ & ((\X~input_o\) # (\Q1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q0~q\,
	datab => \X~input_o\,
	datac => \Q1~q\,
	combout => \inst9~0_combout\);

Q1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q1~q\);

\inst17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst17~0_combout\ = (\X~input_o\ & (\Q1~q\ & !\Q0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X~input_o\,
	datab => \Q1~q\,
	datad => \Q0~q\,
	combout => \inst17~0_combout\);

ww_Y <= \Y~output_o\;
END structure;


