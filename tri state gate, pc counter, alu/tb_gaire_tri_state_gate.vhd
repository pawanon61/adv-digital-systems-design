LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_tri_state_gate IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_tri_state_gate IS
	constant w:integer:= 16;

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

COMPONENT gaire_tri_state_gate  			-- In/out Ports

GENERIC(w:integer:= 16);

port(
            EN   : in  std_logic;
	       input    : in  std_logic_vector (w-1 DOWNTO 0);      
            output    : out std_logic_vector (w-1 DOWNTO 0) 
);
END COMPONENT;



---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_tri_state_gate_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_tri_state_gate_expected_output.txt";   -- Expected output (binary)

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL input: STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
  SIGNAL output : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
  SIGNAL EN: STD_LOGIC;
  SIGNAL CLK: STD_LOGIC;
  SIGNAL Exp_output : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
  SIGNAL Test_output : STD_LOGIC:='X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_tri_state_gate: gaire_tri_state_gate generic map (w)
port map (EN, input, output);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable vEN : std_logic := '0';
variable vinput   : std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable voutput : std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable vExp_output : std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable vTest_output : std_logic := '0';
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
	  Test_output <= 'Z';
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
	  	  Test_output  <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	  
	ELSE      --Begin processing

		read(in_line, vEN);
		EN  <= vEN;

		read(in_line, vinput);
		input  <= vinput;
		

		read(exo_line, vexp_output);
		read(exo_line, vTest_output);
		
    vlinenumber :=LineNumber;
	

    CYCLE(1,CLK);
    
    Exp_output      <= vexp_output;
    
      
    if (Exp_output = output) then
      Test_output <= '0';
    else
      Test_output <= 'X';
    end if;
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_tri_state_gate OF tb_gaire_tri_state_gate IS
	FOR TESTBENCH
		FOR Instgaire_tri_state_gate: gaire_tri_state_gate
			use entity work.gaire_tri_state_gate(arch_tri_state_gate);
		END FOR;
	END FOR;
END;

