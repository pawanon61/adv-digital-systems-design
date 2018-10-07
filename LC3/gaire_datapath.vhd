
--===============================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Data_Path_ALL is
generic(
	w: integer := 16;
	p: integer := 4
);
port(
	CLK: in std_logic;
	Reset: in std_logic
);
end Data_Path_ALL;

architecture structural of Data_Path_ALL is

------------------------------------------------------------
-------------------- Component decleration -----------------
------------------------------------------------------------

-------------- 16 bit register ----------------------------

component gaire_n_bit_register is
    generic(
            w: Integer := 16
    );
    port (  CLK : in std_logic;
            Reset : IN STD_LOGIC;
            En : IN STD_LOGIC;
            OP_A : IN STD_LOGIC_VECTOR(w-1 DOWNTO 0);
            OP_Q : OUT STD_LOGIC_vector(w-1 DOWNTO 0)
        );
end component;

-------------- register array ------------------------------

component gaire_register_array is
generic(w: integer:= 16;
        p: integer := 3;
        E: natural := 8
);
port(CLK: in std_logic;
    reset: in std_logic;
    LD_REG: in std_logic; -- enable to tell us which register in the array is active for input
    DR: in std_logic_vector(p-1 downto 0);
    OP_A: in std_logic_vector(w-1 downto 0);
    SR1: in std_logic_vector(p-1 downto 0);
    SR2: in std_logic_vector(p-1 downto 0);
    OP_Q1: out std_logic_vector(w-1 downto 0);
    OP_Q2: out std_logic_vector(w-1 downto 0)
);
end component;

-------------- sign extenders -------------------------------

component gaire_5_to_16_bit_sign_extender is
generic (p: integer:= 16;   
         w: integer:= 5);
port (CLK: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end component;

component gaire_6_to_16_bit_sign_extender is
generic (p: integer:= 16;   
         w: integer:= 6);
port (CLK: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end component;

component gaire_8_to_16_bit_zero_extender is
generic (p: integer:= 16;   
         w: integer:= 8);
port (CLK: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end component;

component gaire_9_to_16_bit_sign_extender is
generic (p: integer:= 16;   
         w: integer:= 9);
port (CLK: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end component;

component gaire_11_to_16_bit_sign_extender is
generic (p: integer:= 16;   
         w: integer:= 11);
port (CLK: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end component;

------------------------- MUXs -----------------------------

component gaire_2_to_1_multiplexer is
port(
	a_0: in std_logic_vector(15 downto 0);
	a_1: in std_logic_vector(15 downto 0);
	y: out std_logic_vector(15 downto 0);
	sel: in std_logic);
end component;

component gaire_3_to_1_multiplexer is
port(
	a_0: in std_logic_vector(15 downto 0);
	a_1: in std_logic_vector(15 downto 0);
	a_2: in std_logic_vector(15 downto 0);
	y: out std_logic_vector(15 downto 0);
	sel: in std_logic_vector(1 downto 0));
end component;

component gaire_4_to_1_multiplexer is
port(
	a_0: in std_logic_vector(15 downto 0);
	a_1: in std_logic_vector(15 downto 0);
	a_2: in std_logic_vector(15 downto 0);
	a_3: in std_logic_vector(15 downto 0);
	y: out std_logic_vector(15 downto 0);
	sel: in std_logic_vector(1 downto 0));
end component;

---------------- Adder -------------------------
component gaire_adder is
port(	OP_A: in std_logic_vector(15 DOWNTO 0);
	OP_B: in std_logic_vector(15 DOWNTO 0);
	OP_Q: out std_logic_vector(15 DOWNTO 0)
);
end component;

---------------- Tri state gate ---------------------------

component gaire_tri_state_gate is
generic(w:integer:= 16);
port( EN: in std_logic;
	OP_A: in std_logic_vector(w-1 downto 0);
	OP_Q: out std_logic_vector(w-1 downto 0)
);
end component;

------------------- ALU -----------------------------------

component gaire_alu is
generic(w: integer:= 16);
port(
	OP_A: in std_logic_vector(w-1 downto 0);
	OP_B: in std_logic_vector(w-1 downto 0);
	sel: in std_logic_vector(1 downto 0);
	OP_Q: out std_logic_vector(w-1 downto 0)
);
end component;

------------------- PC counter ----------------------------

component gaire_program_counter is
	generic(w: integer := 16);
	port(CLK: in std_logic;
	reset: in std_logic;
	EN: in std_logic;
	OP_A: in std_logic_vector(w-1 downto 0);
	OP_Q: out std_logic_vector(w-1 downto 0);
	OP_Z: out std_logic_vector(w-1 downto 0)
);
end component;


--------------------- NZP ---------------------------------

component NZP is 
port(
     CLK: in std_logic;
     reset: in std_logic;
     EN: in std_logic;
     OP_A: in std_logic_vector(15 downto 0);
     OP_Q: out std_logic_vector(2 downto 0)
     );
end component;

----------------------- RAM -------------------------------

component gaire_RAM is
generic(ADD_WIDTH: integer:= 9;  -- address bit size 2**9=512 words
        WIDTH: integer:= 16);  -- data size
port(
    CLK: in std_logic;  --clock
    mem_wr_rd_add: in std_logic_vector(ADD_WIDTH-1 downto 0);
    data_in: in std_logic_vector(WIDTH-1 downto 0);  --input data
    data_out: out std_logic_vector(WIDTH-1 downto 0);  --output data
    read_write_en: in std_logic;  --read(0)/write(1) enable
    mem_en: in std_logic);        
end component;

------------------------- MAR ------------------------------

component gaire_MAR_REG is 
port (
	CLK: std_logic; 
	EN: in std_logic; 
	Reset: in std_logic;
	BUS_IN: in std_logic_vector(15 downto 0); 
	MAR_OUT: out std_logic_vector(8 downto 0) 
); 
end component; 

------------------------- MDR ------------------------------

component gaire_MDR_REG is 
port (
	CLK: in std_logic; 
	EN: in std_logic; 
	Reset: in std_logic;
	BUS_IN: in std_logic_vector(15 downto 0); --FROM BUS (WRITE)
	MEM_IN: in std_logic_vector(15 downto 0); --FROM MEM (READ)
	MDR_OUT: out std_logic_vector(15 downto 0)-- To Bus
); 
end component; 

------------------------- FSM ------------------------------

component LC3_FSM IS
port(
	CLK: IN STD_LOGIC;				--clk
	Reset:IN STD_LOGIC;				--reset
	OUT_FROM_IR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);  --instruction
	FROM_NZP: IN STD_LOGIC_VECTOR(2 DOWNTO 0);		--nzp flag
	LD_IR: OUT STD_LOGIC;				--IR ENABLE
	LD_MARMUX: out std_logic; --sel Z(1), ADDER(0);
	LD_REG1: out std_logic; --enable for reg file
	LD_PC: OUT STD_LOGIC;				--EN PC(1) TO WRITE
	LD_CC: OUT STD_LOGIC;
	LD_MAR: OUT STD_LOGIC;				--EN MAR(1) TO WRITE
	LD_MDR: OUT STD_LOGIC;				--EN MDR(1) FROM BUS, (0) FROM MEM
	--LD_NZP: OUT STD_LOGIC;				--EN NZP(1) TO WRITE
	LD_MEM: OUT STD_LOGIC;				--EN MEM91) TO WRITE, (0) OTHERWISE
	GATE_PC1: OUT STD_LOGIC;			--(1) TO BUS
	GATE_MAR: OUT STD_LOGIC;			--(1) TO BUS
	GATE_ALU1: OUT STD_LOGIC;			--(1) TO BUS
	GATE_MDR1: OUT STD_LOGIC;			--(1) TO BUS
	ADDR2_MUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);--(00)Z (01)S5 (10)S8 (11)S10
	ADDR1_MUX_SEL: OUT STD_LOGIC;			--(1) SR1, (0) PCIN
	SR1_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);	-- OUTPUT REG
	SR2_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);	--OUTPUT REG
	DR_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);	--INPUT REG
	SR2MUX_SEL: OUT STD_LOGIC;			--(1)S4, (0)SR2IN
	PCMUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);		--(00)PCIN, (01)ADDERIN, (10)BUS IN
	ALU_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);	--(00)SR11+2, (01)SR1&SR2, (10)SR1, (11)~SR1
	MEM_EN: OUT STD_LOGIC				--(1) TO EN
);

end component;

------------------------------------------------------------
----------------------- SIGNALS ----------------------------
------------------------------------------------------------

SIGNAL FROM_IR : std_logic_vector (15 downto 0);
SIGNAL FROM_SEXT5 : std_logic_vector (15 downto 0);
SIGNAL FROM_SEXT8 : std_logic_vector (15 downto 0);
SIGNAL FROM_SEXT10: std_logic_vector (15 downto 0);
SIGNAL FROM_ZEXT7 : std_logic_vector (15 downto 0);
SIGNAL FROM_SEXT4 : std_logic_vector (15 downto 0);


SIGNAL LD_REG1 : std_logic;
SIGNAL LD_IR : std_logic;
SIGNAL DR_SEL : std_logic_vector (2 downto 0);
SIGNAL FROM_BUS : std_logic_vector (15 downto 0);
SIGNAL SR1_SEL: std_logic_vector (2 downto 0);
SIGNAL SR2_SEL : std_logic_vector (2 downto 0);
SIGNAL FROM_SR1_RF : std_logic_vector (15 downto 0);
SIGNAL FROM_SR2_RF : std_logic_vector (15 downto 0);
SIGNAL FROM_SR2_MUX : std_logic_vector (15 downto 0);
SIGNAL ALU_SEL: std_logic_vector (1 downto 0);
SIGNAL FROM_ALU: std_logic_vector (15 downto 0);
SIGNAL GATE_ALU1: std_logic;

SIGNAL ADDR1_MUX_SEL : std_logic;
SIGNAL ADDR2_MUX_SEL : std_logic_vector (1 downto 0);
SIGNAL SR2MUX_SEL : std_logic; 
SIGNAL ZERO : std_logic_vector (15 downto 0);
SIGNAL FROM_PCMUX : std_logic_vector (15 downto 0);
SIGNAL FROM_ADDR2MUX : std_logic_vector (15 downto 0);
SIGNAL FROM_ADDR1MUX : std_logic_vector (15 downto 0);
SIGNAL FROM_PC_CNTRBUS : std_logic_vector (15 downto 0);
SIGNAL FROM_PC_CNTRINC : std_logic_vector (15 downto 0);
SIGNAL FROM_PC1 : std_logic_vector (15 downto 0);
SIGNAL FROM_BUS_NZP : std_logic_vector (15 downto 0);
SIGNAL FROM_NZP: std_logic_vector(2 downto 0);
SIGNAL FROM_ADDER : std_logic_vector (15 downto 0);
SIGNAL FROM_MARMUX : std_logic_vector (15 downto 0);
SIGNAL MEM_EN : std_logic;
SIGNAL FROM_MDR : std_logic_vector (15 downto 0);
SIGNAL FROM_MEM : std_logic_vector (15 downto 0);
SIGNAL FROM_MAR : std_logic_vector (8 downto 0);
SIGNAL LD_PC : std_logic;
SIGNAL LD_MAR : std_logic;
SIGNAL LD_MEM : std_logic;
SIGNAL LD_MDR : std_logic;
SIGNAL LD_MARMUX : std_logic;
SIGNAL LD_CC : std_logic;

SIGNAL PCMUX_SEL : std_logic_vector (1 downto 0);
SIGNAL GATE_PC1 : std_logic;
SIGNAL GATE_MAR : std_logic;
SIGNAL GATE_MDR1 : std_logic;

-----------------------------------------------------------
----------------------- INSTANTIATE -----------------------
-----------------------------------------------------------

begin

Bus_to_IR : gaire_n_bit_register port map (CLK, Reset, LD_IR, FROM_BUS, FROM_IR);

IR_TO_SEXT4 : gaire_5_to_16_bit_sign_extender generic map(w, (p+1)) port map ( CLK, Reset, FROM_IR(4 downto 0), FROM_SEXT4);
IR_TO_SEXT5 : gaire_6_to_16_bit_sign_extender generic map(w, (p+2)) port map ( CLK, Reset, FROM_IR(5 downto 0), FROM_SEXT5);
IR_TO_ZEXT7 : gaire_8_to_16_bit_zero_extender generic map(w, (p+4)) port map ( CLK, Reset, FROM_IR(7 downto 0), FROM_ZEXT7);
IR_TO_SEXT8 : gaire_9_to_16_bit_sign_extender generic map(w, (p+5)) port map ( CLK, Reset, FROM_IR(8 downto 0), FROM_SEXT8);
IR_TO_SEXT10 : gaire_11_to_16_bit_sign_extender generic map(w, (p+7)) port map ( CLK, Reset, FROM_IR(10 downto 0), FROM_SEXT10);

FROM_REG_FILE : gaire_register_array generic map (w, p-1, 8) port map (CLK, Reset, LD_REG1, DR_SEL, FROM_BUS, SR1_SEL, SR2_SEL, FROM_SR1_RF, FROM_SR2_RF);
SR2MUX_TO_ALU : gaire_2_to_1_multiplexer port map (FROM_SR2_RF,FROM_SEXT4,FROM_SR2_MUX, SR2MUX_SEL);
FROM_ALU_TO_BUS : gaire_alu port map (FROM_SR1_RF, FROM_SR2_RF, ALU_SEL, FROM_ALU);
FROM_GALU_TO_BUS : gaire_tri_state_gate generic map(w) port map (GATE_ALU1, FROM_ALU, FROM_BUS );

FROM_ADDR2_MUX : gaire_4_to_1_multiplexer port map (FROM_SEXT10, FROM_SEXT8, FROM_SEXT5,ZERO, FROM_ADDR2MUX, ADDR2_MUX_SEL);
FROM_ADDR1_MUX : gaire_2_to_1_multiplexer port map (FROM_SR1_RF,FROM_PC_CNTRBUS, FROM_ADDR1MUX, ADDR1_MUX_SEL);
FROM_ADDER_16 : gaire_adder port map (FROM_ADDR2MUX, FROM_ADDR1MUX, FROM_ADDER);

FROM_PC_MUX : gaire_3_to_1_multiplexer port map (FROM_BUS, FROM_ADDER, FROM_PC_CNTRINC, FROM_PCMUX, PCMUX_SEL);
FROM_PC_CNT : gaire_program_counter generic map (w) port map (CLK, Reset, LD_PC, FROM_PCMUX, FROM_PC_CNTRBUS, FROM_PC_CNTRINC);
FROM_PC_TO_BUS : gaire_tri_state_gate generic map(w) port map (GATE_PC1, FROM_PC_CNTRBUS, FROM_BUS );

MARMUX_TO_TRI : gaire_2_to_1_multiplexer port map (FROM_ZEXT7, FROM_ADDER, FROM_MARMUX, LD_MARMUX);
FROM_MARM_TO_BUS : gaire_tri_state_gate generic map(w) port map (GATE_MAR, FROM_MARMUX, FROM_BUS);

FROM_MAR_TO_MEM : gaire_MAR_REG port map (CLK, LD_MAR, Reset, FROM_BUS, FROM_MAR);
FROM_MEM_TO_MDR : gaire_RAM generic map(((2*p)+1), w) port map (CLK, FROM_MAR, FROM_MDR, FROM_MEM, LD_MEM, MEM_EN);
FROM_MDR_TO_BORM : gaire_MDR_REG port map (CLK,LD_MDR, Reset, FROM_BUS, FROM_MEM, FROM_MDR);
FROM_MDR_TO_BUS : gaire_tri_state_gate generic map(w) port map (GATE_MDR1, FROM_MDR, FROM_BUS);

NZP_TO_FSM : NZP port map (CLK, Reset, LD_CC, FROM_BUS_NZP, FROM_NZP);

FSM_TO_DP : LC3_FSM port map (CLK, Reset, FROM_IR, FROM_NZP, LD_IR, LD_MARMUX, LD_REG1, LD_PC, LD_CC, LD_MAR, LD_MDR, LD_MEM, GATE_PC1, GATE_MAR,
GATE_ALU1, GATE_MDR1, ADDR2_MUX_SEL, ADDR1_MUX_SEL, SR1_SEL, SR2_SEL, DR_SEL, SR2MUX_SEL, PCMUX_SEL, ALU_SEL, MEM_EN );

end structural;