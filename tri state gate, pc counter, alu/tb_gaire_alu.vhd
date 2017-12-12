LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_ALU IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_ALU IS
	constant W:integer:= 16;

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

COMPONENT gaire_ALU  			-- In/out Ports

GENERIC(W:integer:= 16);
	port (sel : in std_logic_vector(1 downto 0);
		OP_A: in std_logic_vector(W-1 downto 0);
	     OP_B: in std_logic_vector(W-1 downto 0);
	     OP_Q: out std_logic_vector(W-1 downto 0)
	      );
END COMPONENT;



---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_alu_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_alu_expected_output.txt";   -- Expected output (binary)

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL CLK: STD_LOGIC;
  SIGNAL sel: STD_LOGIC_VECTOR(1 downto 0);
  SIGNAL OP_A: STD_LOGIC_VECTOR(W-1 downto 0):= (OTHERS => 'X');
  SIGNAL OP_B : STD_LOGIC_VECTOR(W-1 downto 0):= (OTHERS => 'X');
  SIGNAL OP_Q : STD_LOGIC_VECTOR(W-1 downto 0):= (OTHERS => 'X');
  SIGNAL Exp_OP_Q : STD_LOGIC_VECTOR(W-1 downto 0):= (OTHERS => 'X');
  SIGNAL Test_OP_Q : STD_LOGIC:='X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components tb_gaire_16_bit_ALU
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_ALU : gaire_ALU  generic map (W)
port map (sel, OP_A, OP_B, OP_Q);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable vsel : std_logic_vector(1 downto 0):= "00";
variable vOP_A   : std_logic_vector(W-1 downto 0):= (OTHERS => 'X');
variable vOP_B   : std_logic_vector(W-1 downto 0):= (OTHERS => 'X');
variable vOP_Q : std_logic_vector(W-1 downto 0):= (OTHERS => 'X');
variable vExp_OP_Q : std_logic_vector(W-1 downto 0):= (OTHERS => 'X');
variable vTest_OP_Q : std_logic := '0';
variable vlinenumber: integer;

BEGIN

simcomplete := false;

while (not simcomplete) LOOP
  
	if (not endfile(in_file) ) then
		readline(in_file, in_line);
	else
		simcomplete := true;
	end if;

	if (not endfile(exo_file) ) then
		readline(exo_file, exo_line);
	else
		simcomplete := true;
	end if;
	
	if (in_line(1) = '-') then  --Skip comments
		next;
	elsif (in_line(1) = '.')  then  --exit Loop
	  Test_OP_Q <= 'Z';
		simcomplete := true;
	elsif (in_line(1) = '#') then        --Echo comments to out.txt
	  i := 1;
	  while in_line(i) /= '.' LOOP
		comment(i) := in_line(i);
		i := i + 1;
	  end LOOP;

	elsif (exo_line(1) = '-') then  --Skip comments
		next;
	elsif (exo_line(1) = '.')  then  --exit Loop
	  	  Test_OP_Q  <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	  
	ELSE      --Begin processing

		
		read(in_line, vsel);
		sel  <= vsel;

		read(in_line, vOP_A);
		OP_A  <= vOP_A;

		read(in_line, vOP_B);
		OP_B  <= vOP_B;

		read(exo_line, vexp_OP_Q );
		read(exo_line, vTest_OP_Q );
		
    vlinenumber :=LineNumber;
	

    CYCLE(1,CLK);
    
    Exp_OP_Q      <= vexp_OP_Q;
    
      
    if (Exp_OP_Q = OP_Q) then
      Test_OP_Q <= '0';
    else
      Test_OP_Q <= 'X';
    end if;

	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_ALU OF tb_gaire_ALU IS
	FOR TESTBENCH
		FOR Instgaire_ALU: gaire_ALU
			use entity work.gaire_ALU(arch_ALU);
		END FOR;
	END FOR;
END;
