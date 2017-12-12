LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;
use work.util_package.all;
--use work.util_pkg.all;


ENTITY tb_gaire_barrel_shifter IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_barrel_shifter IS
	constant WIDTH: natural := 8;
	constant S_MODE: natural := 0;

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

COMPONENT gaire_barrel_shifter  			-- In/out Ports

GENERIC(WIDTH: natural := 8;
	S_MODE: natural := 0);
port(
a: in std_logic_vector(WIDTH-1 downto 0);
amt: in std_logic_vector(log2c(WIDTH)-1 downto 0);
y: out std_logic_vector(WIDTH-1 downto 0)
);
END COMPONENT;



---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_barrel_shifter_logic_left_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_barrel_shifter_logic_left_expected_output.txt";   -- Expected output (binary)


---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL a: STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (OTHERS => 'X');
  SIGNAL amt: STD_LOGIC_VECTOR(log2c(WIDTH)-1 downto 0);
  SIGNAL y : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => 'X');
  SIGNAL CLK: STD_LOGIC;
  SIGNAL Exp_y : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => 'X');
  SIGNAL Test_y : STD_LOGIC:='X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_barrel_shifter: gaire_barrel_shifter generic map (WIDTH, S_MODE)
port map (a, amt, y);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable va   : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vamt: std_logic_vector(log2c(WIDTH)-1 downto 0):= (OTHERS => 'X');

variable vy : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vExp_y : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vTest_y : std_logic := '0';
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
	  Test_y <= 'Z';
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
	  	  Test_y  <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	

	  
	ELSE      --Begin processing

		
		read(in_line,va);
		a <= va;
		read(in_line, vamt);
		amt  <= vamt;

		read(exo_line, vexp_y );
		read(exo_line, vTest_y );
		
    vlinenumber :=LineNumber;
    

	

    CYCLE(1,CLK);
    
    Exp_y      <= vexp_y;

    
      
    if (Exp_y = y) then
      Test_y <= '0';
    else
      Test_y <= 'X';
    end if;

	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_barrel_shifter_logic_left OF tb_gaire_barrel_shifter IS
	FOR TESTBENCH
		FOR Instgaire_barrel_shifter: gaire_barrel_shifter
			use entity work.gaire_barrel_shifter(para_arch);
		END FOR;
	END FOR;
END;

