-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_mul_0002
-- VHDL created on Mon Mar 30 14:17:06 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_mul_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_mul_0002;

architecture normal of fp_mul_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSum_uid44_fpMulTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid46_fpMulTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid46_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid46_fpMulTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSumMBias_uid46_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid49_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal stickyRange_uid54_fpMulTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid54_fpMulTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid57_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid62_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid63_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid66_fpMulTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal roundBitAndNormalizationOp_uid68_fpMulTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal fracRPreExc_uid70_fpMulTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid70_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid72_fpMulTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid72_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid73_fpMulTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid73_fpMulTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid73_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid75_fpMulTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid75_fpMulTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expOvf_uid75_fpMulTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid90_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid92_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid95_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid95_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid100_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid101_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid103_fpMulTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_reset : std_logic;
    type prodXY_uid105_prod_uid47_fpMulTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_a0 : prodXY_uid105_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid105_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_c0 : prodXY_uid105_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid105_prod_uid47_fpMulTest_cma_c0 : signal is true;
    type prodXY_uid105_prod_uid47_fpMulTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_p : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_u : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_w : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_x : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_y : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_s : prodXY_uid105_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal redist0_expRPreExcExt_uid71_fpMulTest_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist1_fracRPreExc_uid70_fpMulTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist2_normalizeBit_uid49_fpMulTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_signR_uid48_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_expSum_uid44_fpMulTest_q_3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist5_fracXIsZero_uid31_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXIsMax_uid30_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excZ_y_uid29_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracXIsZero_uid17_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_expXIsMax_uid16_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excZ_x_uid15_fpMulTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_b <= a(22 downto 0);

    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid17_fpMulTest(LOGICAL,16)@0 + 1
    fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN cstZeroWF_uid11_fpMulTest_q = frac_x_uid14_fpMulTest_b ELSE "0";
    fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_qi, xout => fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- redist8_fracXIsZero_uid17_fpMulTest_q_4(DELAY,116)
    redist8_fracXIsZero_uid17_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_q, xout => redist8_fracXIsZero_uid17_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111111";

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_b <= a(30 downto 23);

    -- expXIsMax_uid16_fpMulTest(LOGICAL,15)@0 + 1
    expXIsMax_uid16_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_qi, xout => expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- redist9_expXIsMax_uid16_fpMulTest_q_4(DELAY,117)
    redist9_expXIsMax_uid16_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_q, xout => redist9_expXIsMax_uid16_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@4
    excI_x_uid19_fpMulTest_q <= redist9_expXIsMax_uid16_fpMulTest_q_4_q and redist8_fracXIsZero_uid17_fpMulTest_q_4_q;

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000000";

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_b <= b(30 downto 23);

    -- excZ_y_uid29_fpMulTest(LOGICAL,28)@0 + 1
    excZ_y_uid29_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_qi, xout => excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- redist7_excZ_y_uid29_fpMulTest_q_4(DELAY,115)
    redist7_excZ_y_uid29_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_q, xout => redist7_excZ_y_uid29_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid86_fpMulTest(LOGICAL,85)@4
    excYZAndExcXI_uid86_fpMulTest_q <= redist7_excZ_y_uid29_fpMulTest_q_4_q and excI_x_uid19_fpMulTest_q;

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_b <= b(22 downto 0);

    -- fracXIsZero_uid31_fpMulTest(LOGICAL,30)@0 + 1
    fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN cstZeroWF_uid11_fpMulTest_q = frac_y_uid28_fpMulTest_b ELSE "0";
    fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_qi, xout => fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- redist5_fracXIsZero_uid31_fpMulTest_q_4(DELAY,113)
    redist5_fracXIsZero_uid31_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_q, xout => redist5_fracXIsZero_uid31_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- expXIsMax_uid30_fpMulTest(LOGICAL,29)@0 + 1
    expXIsMax_uid30_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_qi, xout => expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- redist6_expXIsMax_uid30_fpMulTest_q_4(DELAY,114)
    redist6_expXIsMax_uid30_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_q, xout => redist6_expXIsMax_uid30_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@4
    excI_y_uid33_fpMulTest_q <= redist6_expXIsMax_uid30_fpMulTest_q_4_q and redist5_fracXIsZero_uid31_fpMulTest_q_4_q;

    -- excZ_x_uid15_fpMulTest(LOGICAL,14)@0 + 1
    excZ_x_uid15_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_qi, xout => excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- redist10_excZ_x_uid15_fpMulTest_q_4(DELAY,118)
    redist10_excZ_x_uid15_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_q, xout => redist10_excZ_x_uid15_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid87_fpMulTest(LOGICAL,86)@4
    excXZAndExcYI_uid87_fpMulTest_q <= redist10_excZ_x_uid15_fpMulTest_q_4_q and excI_y_uid33_fpMulTest_q;

    -- ZeroTimesInf_uid88_fpMulTest(LOGICAL,87)@4
    ZeroTimesInf_uid88_fpMulTest_q <= excXZAndExcYI_uid87_fpMulTest_q or excYZAndExcXI_uid86_fpMulTest_q;

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@4
    fracXIsNotZero_uid32_fpMulTest_q <= not (redist5_fracXIsZero_uid31_fpMulTest_q_4_q);

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@4
    excN_y_uid34_fpMulTest_q <= redist6_expXIsMax_uid30_fpMulTest_q_4_q and fracXIsNotZero_uid32_fpMulTest_q;

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@4
    fracXIsNotZero_uid18_fpMulTest_q <= not (redist8_fracXIsZero_uid17_fpMulTest_q_4_q);

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@4
    excN_x_uid20_fpMulTest_q <= redist9_expXIsMax_uid16_fpMulTest_q_4_q and fracXIsNotZero_uid18_fpMulTest_q;

    -- excRNaN_uid89_fpMulTest(LOGICAL,88)@4
    excRNaN_uid89_fpMulTest_q <= excN_x_uid20_fpMulTest_q or excN_y_uid34_fpMulTest_q or ZeroTimesInf_uid88_fpMulTest_q;

    -- invExcRNaN_uid101_fpMulTest(LOGICAL,100)@4
    invExcRNaN_uid101_fpMulTest_q <= not (excRNaN_uid89_fpMulTest_q);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(b(31 downto 31));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_qi <= signX_uid8_fpMulTest_b xor signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, clk => clk, aclr => areset );

    -- redist3_signR_uid48_fpMulTest_q_4(DELAY,111)
    redist3_signR_uid48_fpMulTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist3_signR_uid48_fpMulTest_q_4_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid102_fpMulTest(LOGICAL,101)@4
    signRPostExc_uid102_fpMulTest_q <= redist3_signR_uid48_fpMulTest_q_4_q and invExcRNaN_uid101_fpMulTest_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_cma(CHAINMULTADD,107)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_cma_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 <= '1';
    prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 <= prodXY_uid105_prod_uid47_fpMulTest_cma_ena0;
    prodXY_uid105_prod_uid47_fpMulTest_cma_p(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_a0(0) * prodXY_uid105_prod_uid47_fpMulTest_cma_c0(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(prodXY_uid105_prod_uid47_fpMulTest_cma_p(0),48);
    prodXY_uid105_prod_uid47_fpMulTest_cma_w(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_u(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_x(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_w(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_y(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_x(0);
    prodXY_uid105_prod_uid47_fpMulTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid105_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid105_prod_uid47_fpMulTest_cma_ena0 = '1') THEN
                prodXY_uid105_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(ofracX_uid40_fpMulTest_q),24);
                prodXY_uid105_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(ofracY_uid43_fpMulTest_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid105_prod_uid47_fpMulTest_cma_ena1 = '1') THEN
                prodXY_uid105_prod_uid47_fpMulTest_cma_s(0) <= prodXY_uid105_prod_uid47_fpMulTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 48, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_s(0)(47 downto 0)), xout => prodXY_uid105_prod_uid47_fpMulTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid105_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_qq(47 downto 0));

    -- normalizeBit_uid49_fpMulTest(BITSELECT,48)@2
    normalizeBit_uid49_fpMulTest_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_q(47 downto 47));

    -- redist2_normalizeBit_uid49_fpMulTest_b_1(DELAY,110)
    redist2_normalizeBit_uid49_fpMulTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => normalizeBit_uid49_fpMulTest_b, xout => redist2_normalizeBit_uid49_fpMulTest_b_1_q, clk => clk, aclr => areset );

    -- roundBitDetectionConstant_uid63_fpMulTest(CONSTANT,62)
    roundBitDetectionConstant_uid63_fpMulTest_q <= "010";

    -- fracRPostNormHigh_uid51_fpMulTest(BITSELECT,50)@2
    fracRPostNormHigh_uid51_fpMulTest_in <= prodXY_uid105_prod_uid47_fpMulTest_cma_q(46 downto 0);
    fracRPostNormHigh_uid51_fpMulTest_b <= fracRPostNormHigh_uid51_fpMulTest_in(46 downto 23);

    -- fracRPostNormLow_uid52_fpMulTest(BITSELECT,51)@2
    fracRPostNormLow_uid52_fpMulTest_in <= prodXY_uid105_prod_uid47_fpMulTest_cma_q(45 downto 0);
    fracRPostNormLow_uid52_fpMulTest_b <= fracRPostNormLow_uid52_fpMulTest_in(45 downto 22);

    -- fracRPostNorm_uid53_fpMulTest(MUX,52)@2 + 1
    fracRPostNorm_uid53_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    fracRPostNorm_uid53_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormLow_uid52_fpMulTest_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_q <= fracRPostNormHigh_uid51_fpMulTest_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostNorm1dto0_uid61_fpMulTest(BITSELECT,60)@3
    fracRPostNorm1dto0_uid61_fpMulTest_in <= fracRPostNorm_uid53_fpMulTest_q(1 downto 0);
    fracRPostNorm1dto0_uid61_fpMulTest_b <= fracRPostNorm1dto0_uid61_fpMulTest_in(1 downto 0);

    -- extraStickyBitOfProd_uid55_fpMulTest(BITSELECT,54)@2
    extraStickyBitOfProd_uid55_fpMulTest_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_cma_q(22 downto 0));
    extraStickyBitOfProd_uid55_fpMulTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid55_fpMulTest_in(22 downto 22));

    -- extraStickyBit_uid56_fpMulTest(MUX,55)@2
    extraStickyBit_uid56_fpMulTest_s <= normalizeBit_uid49_fpMulTest_b;
    extraStickyBit_uid56_fpMulTest_combproc: PROCESS (extraStickyBit_uid56_fpMulTest_s, GND_q, extraStickyBitOfProd_uid55_fpMulTest_b)
    BEGIN
        CASE (extraStickyBit_uid56_fpMulTest_s) IS
            WHEN "0" => extraStickyBit_uid56_fpMulTest_q <= GND_q;
            WHEN "1" => extraStickyBit_uid56_fpMulTest_q <= extraStickyBitOfProd_uid55_fpMulTest_b;
            WHEN OTHERS => extraStickyBit_uid56_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid54_fpMulTest(BITSELECT,53)@2
    stickyRange_uid54_fpMulTest_in <= prodXY_uid105_prod_uid47_fpMulTest_cma_q(21 downto 0);
    stickyRange_uid54_fpMulTest_b <= stickyRange_uid54_fpMulTest_in(21 downto 0);

    -- stickyExtendedRange_uid57_fpMulTest(BITJOIN,56)@2
    stickyExtendedRange_uid57_fpMulTest_q <= extraStickyBit_uid56_fpMulTest_q & stickyRange_uid54_fpMulTest_b;

    -- stickyRangeComparator_uid59_fpMulTest(LOGICAL,58)@2 + 1
    stickyRangeComparator_uid59_fpMulTest_qi <= "1" WHEN stickyExtendedRange_uid57_fpMulTest_q = cstZeroWF_uid11_fpMulTest_q ELSE "0";
    stickyRangeComparator_uid59_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyRangeComparator_uid59_fpMulTest_qi, xout => stickyRangeComparator_uid59_fpMulTest_q, clk => clk, aclr => areset );

    -- sticky_uid60_fpMulTest(LOGICAL,59)@3
    sticky_uid60_fpMulTest_q <= not (stickyRangeComparator_uid59_fpMulTest_q);

    -- lrs_uid62_fpMulTest(BITJOIN,61)@3
    lrs_uid62_fpMulTest_q <= fracRPostNorm1dto0_uid61_fpMulTest_b & sticky_uid60_fpMulTest_q;

    -- roundBitDetectionPattern_uid64_fpMulTest(LOGICAL,63)@3
    roundBitDetectionPattern_uid64_fpMulTest_q <= "1" WHEN lrs_uid62_fpMulTest_q = roundBitDetectionConstant_uid63_fpMulTest_q ELSE "0";

    -- roundBit_uid65_fpMulTest(LOGICAL,64)@3
    roundBit_uid65_fpMulTest_q <= not (roundBitDetectionPattern_uid64_fpMulTest_q);

    -- roundBitAndNormalizationOp_uid68_fpMulTest(BITJOIN,67)@3
    roundBitAndNormalizationOp_uid68_fpMulTest_q <= GND_q & redist2_normalizeBit_uid49_fpMulTest_b_1_q & cstZeroWF_uid11_fpMulTest_q & roundBit_uid65_fpMulTest_q;

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111111";

    -- expSum_uid44_fpMulTest(ADD,43)@0 + 1
    expSum_uid44_fpMulTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpMulTest_b);
    expSum_uid44_fpMulTest_b <= STD_LOGIC_VECTOR("0" & expY_uid7_fpMulTest_b);
    expSum_uid44_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid44_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_a) + UNSIGNED(expSum_uid44_fpMulTest_b));
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_q <= expSum_uid44_fpMulTest_o(8 downto 0);

    -- redist4_expSum_uid44_fpMulTest_q_3(DELAY,112)
    redist4_expSum_uid44_fpMulTest_q_3 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_q, xout => redist4_expSum_uid44_fpMulTest_q_3_q, clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest(SUB,45)@3
    expSumMBias_uid46_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist4_expSum_uid44_fpMulTest_q_3_q));
    expSumMBias_uid46_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid45_fpMulTest_q(9)) & biasInc_uid45_fpMulTest_q));
    expSumMBias_uid46_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_a) - SIGNED(expSumMBias_uid46_fpMulTest_b));
    expSumMBias_uid46_fpMulTest_q <= expSumMBias_uid46_fpMulTest_o(10 downto 0);

    -- expFracPreRound_uid66_fpMulTest(BITJOIN,65)@3
    expFracPreRound_uid66_fpMulTest_q <= expSumMBias_uid46_fpMulTest_q & fracRPostNorm_uid53_fpMulTest_q;

    -- expFracRPostRounding_uid69_fpMulTest(ADD,68)@3
    expFracRPostRounding_uid69_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => expFracPreRound_uid66_fpMulTest_q(34)) & expFracPreRound_uid66_fpMulTest_q));
    expFracRPostRounding_uid69_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & roundBitAndNormalizationOp_uid68_fpMulTest_q));
    expFracRPostRounding_uid69_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid69_fpMulTest_a) + SIGNED(expFracRPostRounding_uid69_fpMulTest_b));
    expFracRPostRounding_uid69_fpMulTest_q <= expFracRPostRounding_uid69_fpMulTest_o(35 downto 0);

    -- expRPreExcExt_uid71_fpMulTest(BITSELECT,70)@3
    expRPreExcExt_uid71_fpMulTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_q(35 downto 24));

    -- redist0_expRPreExcExt_uid71_fpMulTest_b_1(DELAY,108)
    redist0_expRPreExcExt_uid71_fpMulTest_b_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExcExt_uid71_fpMulTest_b, xout => redist0_expRPreExcExt_uid71_fpMulTest_b_1_q, clk => clk, aclr => areset );

    -- expRPreExc_uid72_fpMulTest(BITSELECT,71)@4
    expRPreExc_uid72_fpMulTest_in <= redist0_expRPreExcExt_uid71_fpMulTest_b_1_q(7 downto 0);
    expRPreExc_uid72_fpMulTest_b <= expRPreExc_uid72_fpMulTest_in(7 downto 0);

    -- expOvf_uid75_fpMulTest(COMPARE,74)@4
    expOvf_uid75_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist0_expRPreExcExt_uid71_fpMulTest_b_1_q(11)) & redist0_expRPreExcExt_uid71_fpMulTest_b_1_q));
    expOvf_uid75_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid10_fpMulTest_q));
    expOvf_uid75_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid75_fpMulTest_a) - SIGNED(expOvf_uid75_fpMulTest_b));
    expOvf_uid75_fpMulTest_n(0) <= not (expOvf_uid75_fpMulTest_o(13));

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@4
    invExpXIsMax_uid35_fpMulTest_q <= not (redist6_expXIsMax_uid30_fpMulTest_q_4_q);

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@4
    InvExpXIsZero_uid36_fpMulTest_q <= not (redist7_excZ_y_uid29_fpMulTest_q_4_q);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@4
    excR_y_uid37_fpMulTest_q <= InvExpXIsZero_uid36_fpMulTest_q and invExpXIsMax_uid35_fpMulTest_q;

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@4
    invExpXIsMax_uid21_fpMulTest_q <= not (redist9_expXIsMax_uid16_fpMulTest_q_4_q);

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@4
    InvExpXIsZero_uid22_fpMulTest_q <= not (redist10_excZ_x_uid15_fpMulTest_q_4_q);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@4
    excR_x_uid23_fpMulTest_q <= InvExpXIsZero_uid22_fpMulTest_q and invExpXIsMax_uid21_fpMulTest_q;

    -- ExcROvfAndInReg_uid84_fpMulTest(LOGICAL,83)@4
    ExcROvfAndInReg_uid84_fpMulTest_q <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expOvf_uid75_fpMulTest_n;

    -- excYRAndExcXI_uid83_fpMulTest(LOGICAL,82)@4
    excYRAndExcXI_uid83_fpMulTest_q <= excR_y_uid37_fpMulTest_q and excI_x_uid19_fpMulTest_q;

    -- excXRAndExcYI_uid82_fpMulTest(LOGICAL,81)@4
    excXRAndExcYI_uid82_fpMulTest_q <= excR_x_uid23_fpMulTest_q and excI_y_uid33_fpMulTest_q;

    -- excXIAndExcYI_uid81_fpMulTest(LOGICAL,80)@4
    excXIAndExcYI_uid81_fpMulTest_q <= excI_x_uid19_fpMulTest_q and excI_y_uid33_fpMulTest_q;

    -- excRInf_uid85_fpMulTest(LOGICAL,84)@4
    excRInf_uid85_fpMulTest_q <= excXIAndExcYI_uid81_fpMulTest_q or excXRAndExcYI_uid82_fpMulTest_q or excYRAndExcXI_uid83_fpMulTest_q or ExcROvfAndInReg_uid84_fpMulTest_q;

    -- expUdf_uid73_fpMulTest(COMPARE,72)@4
    expUdf_uid73_fpMulTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & GND_q));
    expUdf_uid73_fpMulTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist0_expRPreExcExt_uid71_fpMulTest_b_1_q(11)) & redist0_expRPreExcExt_uid71_fpMulTest_b_1_q));
    expUdf_uid73_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid73_fpMulTest_a) - SIGNED(expUdf_uid73_fpMulTest_b));
    expUdf_uid73_fpMulTest_n(0) <= not (expUdf_uid73_fpMulTest_o(13));

    -- excZC3_uid79_fpMulTest(LOGICAL,78)@4
    excZC3_uid79_fpMulTest_q <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expUdf_uid73_fpMulTest_n;

    -- excYZAndExcXR_uid78_fpMulTest(LOGICAL,77)@4
    excYZAndExcXR_uid78_fpMulTest_q <= redist7_excZ_y_uid29_fpMulTest_q_4_q and excR_x_uid23_fpMulTest_q;

    -- excXZAndExcYR_uid77_fpMulTest(LOGICAL,76)@4
    excXZAndExcYR_uid77_fpMulTest_q <= redist10_excZ_x_uid15_fpMulTest_q_4_q and excR_y_uid37_fpMulTest_q;

    -- excXZAndExcYZ_uid76_fpMulTest(LOGICAL,75)@4
    excXZAndExcYZ_uid76_fpMulTest_q <= redist10_excZ_x_uid15_fpMulTest_q_4_q and redist7_excZ_y_uid29_fpMulTest_q_4_q;

    -- excRZero_uid80_fpMulTest(LOGICAL,79)@4
    excRZero_uid80_fpMulTest_q <= excXZAndExcYZ_uid76_fpMulTest_q or excXZAndExcYR_uid77_fpMulTest_q or excYZAndExcXR_uid78_fpMulTest_q or excZC3_uid79_fpMulTest_q;

    -- concExc_uid90_fpMulTest(BITJOIN,89)@4
    concExc_uid90_fpMulTest_q <= excRNaN_uid89_fpMulTest_q & excRInf_uid85_fpMulTest_q & excRZero_uid80_fpMulTest_q;

    -- excREnc_uid91_fpMulTest(LOOKUP,90)@4
    excREnc_uid91_fpMulTest_combproc: PROCESS (concExc_uid90_fpMulTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid90_fpMulTest_q) IS
            WHEN "000" => excREnc_uid91_fpMulTest_q <= "01";
            WHEN "001" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "010" => excREnc_uid91_fpMulTest_q <= "10";
            WHEN "011" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "100" => excREnc_uid91_fpMulTest_q <= "11";
            WHEN "101" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "110" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "111" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid91_fpMulTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid100_fpMulTest(MUX,99)@4
    expRPostExc_uid100_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    expRPostExc_uid100_fpMulTest_combproc: PROCESS (expRPostExc_uid100_fpMulTest_s, cstAllZWE_uid12_fpMulTest_q, expRPreExc_uid72_fpMulTest_b, cstAllOWE_uid10_fpMulTest_q)
    BEGIN
        CASE (expRPostExc_uid100_fpMulTest_s) IS
            WHEN "00" => expRPostExc_uid100_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
            WHEN "01" => expRPostExc_uid100_fpMulTest_q <= expRPreExc_uid72_fpMulTest_b;
            WHEN "10" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN "11" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN OTHERS => expRPostExc_uid100_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid92_fpMulTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpMulTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid70_fpMulTest(BITSELECT,69)@3
    fracRPreExc_uid70_fpMulTest_in <= expFracRPostRounding_uid69_fpMulTest_q(23 downto 0);
    fracRPreExc_uid70_fpMulTest_b <= fracRPreExc_uid70_fpMulTest_in(23 downto 1);

    -- redist1_fracRPreExc_uid70_fpMulTest_b_1(DELAY,109)
    redist1_fracRPreExc_uid70_fpMulTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid70_fpMulTest_b, xout => redist1_fracRPreExc_uid70_fpMulTest_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid95_fpMulTest(MUX,94)@4
    fracRPostExc_uid95_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    fracRPostExc_uid95_fpMulTest_combproc: PROCESS (fracRPostExc_uid95_fpMulTest_s, cstZeroWF_uid11_fpMulTest_q, redist1_fracRPreExc_uid70_fpMulTest_b_1_q, oneFracRPostExc2_uid92_fpMulTest_q)
    BEGIN
        CASE (fracRPostExc_uid95_fpMulTest_s) IS
            WHEN "00" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "01" => fracRPostExc_uid95_fpMulTest_q <= redist1_fracRPreExc_uid70_fpMulTest_b_1_q;
            WHEN "10" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "11" => fracRPostExc_uid95_fpMulTest_q <= oneFracRPostExc2_uid92_fpMulTest_q;
            WHEN OTHERS => fracRPostExc_uid95_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid103_fpMulTest(BITJOIN,102)@4
    R_uid103_fpMulTest_q <= signRPostExc_uid102_fpMulTest_q & expRPostExc_uid100_fpMulTest_q & fracRPostExc_uid95_fpMulTest_q;

    -- xOut(GPOUT,4)@4
    q <= R_uid103_fpMulTest_q;

END normal;
