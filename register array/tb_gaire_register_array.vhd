LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_register_array IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_register_array IS
	
---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------
CONSTANT w: integer := 16;
CONSTANT p: integer:= 3;
CONSTANT E: natural := 8;

component gaire_register_array            -- In/Out ports

generic (w: INTEGER:= 16;
        p: INTEGER:= 3;
        E: NATURAL:= 8
        );

port(CLK: in std_logic;
    reset: in std_logic;
    LD_REG: in std_logic;   --enable to tell us which register in the array is active for input
    DR: in std_logic_vector(p-1 downto 0);
    OP_A: in std_logic_vector(w-1 downto 0);
    SR1: in std_logic_vector(p-1 downto 0);
    SR2: in std_logic_vector(p-1 downto 0);
    OP_Q1: out std_logic_vector(w-1 downto 0);
    OP_Q2: out std_logic_vector(w-1 downto 0)
);

end component ;

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_register_array_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_register_array_expected_output.txt";   -- Expected output (binary)
FILE out_file : TEXT open  write_mode is  "AMOO_EVENPD_Book_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "AMOO_EVENPD_Book_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "AMOO_EVENPD_Book_hex_out_dacus.txt";



---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------
SIGNAL CLK: STD_LOGIC;

    SIGNAL reset:  std_logic:='X';
    SIGNAL LD_REG:  std_logic:='X'; 
    SIGNAL DR: std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
    SIGNAL OP_A:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
    SIGNAL SR1:  std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
    SIGNAL  SR2: std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
    SIGNAL  OP_Q1:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
    SIGNAL  OP_Q2:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
    SIGNAL Exp_OP_Q1 : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
    SIGNAL Exp_OP_Q2 : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
    SIGNAL Test_OP_Q1 : STD_LOGIC:='X';
    SIGNAL Test_OP_Q2 : STD_LOGIC:='X';
    SIGNAL LineNumber: integer:=0;
---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_register_array: gaire_register_array generic map (w, p, e)
port map ( CLK, reset, LD_REG, DR, OP_A, SR1, SR2, OP_Q1, OP_Q2);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;


variable vreset:  std_logic:='X';
variable vLD_REG:  std_logic:='X'; 
variable vDR: std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
variable vOP_A:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable vSR1:  std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
variable vSR2: std_logic_vector(p-1 downto 0):= (OTHERS => 'X');
variable vOP_Q1:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable vOP_Q2:  std_logic_vector(w-1 downto 0):= (OTHERS => 'X');
variable vTest_OP_Q1 : STD_LOGIC:='0';
variable vTest_OP_Q2 : STD_LOGIC:='0';
variable vExp_OP_Q1 : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
variable vExp_OP_Q2 : STD_LOGIC_VECTOR(w-1 downto 0):= (OTHERS => 'X');
variable vLineNumber: integer;

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
	  Test_OP_Q1 <= 'Z';
          Test_OP_Q2 <= 'Z';
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
	  	   Test_OP_Q1 <= 'Z';
          	   Test_OP_Q2 <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	  
	ELSE      --Begin processing

		
		read(in_line, vreset);
		reset  <= vreset;
		read(in_line, vLD_REG);
		LD_REG  <= vLD_REG;

		read(in_line, vDR);
		DR <= vDR;

		read(in_line, vOP_A);
		OP_A <= vOP_A;

		read(in_line, vSR1);
		SR1 <= vSR1;

		read(in_line, vSR2);
		SR2 <= vSR2;

		read(exo_line, vExp_OP_Q1);
                read(exo_line, vExp_OP_Q2);
		
		
    vlinenumber :=LineNumber;
	

    CYCLE(1,CLK);
    
    Exp_OP_Q1      <= vExp_OP_Q1  ;
     Exp_OP_Q2      <= vExp_OP_Q2;
      
    if (Exp_OP_Q1 = OP_Q1) then
      Test_OP_Q1 <= '0';
    else
      Test_OP_Q1<= 'X';
    end if;


 
    
      
    if (Exp_OP_Q2 = OP_Q2) then
      Test_OP_Q2 <= '0';
    else
      Test_OP_Q2 <= 'X';
    end if;

	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_register_array OF tb_gaire_register_array IS
	FOR TESTBENCH
		FOR Instgaire_register_array: gaire_register_array
			
		END FOR;
	END FOR;
END;
