LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_n_bit_register IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_n_bit_register IS

constant w:integer := 16;

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT gaire_n_bit_register  			-- In/out Ports
	generic(
            W: Integer := 16
    );
    port (  clk : in std_logic;
            reset : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            OP_A : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
            OP_Q : OUT STD_LOGIC_vector(W-1 DOWNTO 0)
        );
END COMPONENT;



COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_16_bit_register_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_16_bit_register_expected_output.txt";   -- Expected output (binary)

FILE out_file : TEXT open  write_mode is  "AMOO_EVENPD_Book_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "AMOO_EVENPD_Book_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "AMOO_EVENPD_Book_hex_out_dacus.txt";

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL OP_A: STD_LOGIC_VECTOR(w-1 downto 0):= (others => 'X');
  SIGNAL EN: STD_LOGIC := 'X';
  SIGNAL CLK: STD_LOGIC;	
  SIGNAL reset: STD_LOGIC := 'X';
  SIGNAL OP_Q : STD_LOGIC_VECTOR(w-1 downto 0):= (others => 'X');
  SIGNAL Exp_OP_Q : STD_LOGIC_VECTOR(w-1 downto 0):= (others => 'X');
  SIGNAL Test_OP_Q : STD_LOGIC:= 'X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_n_bit_register: gaire_n_bit_register generic map (w) 
port map(CLK, reset, EN, OP_A, OP_Q);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line, out_line, xout_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable vOP_A   : std_logic_vector(w-1 downto 0):= (others => 'X');
variable vEN : std_logic:= 'X';
variable vreset : std_logic:= 'X';
variable vOP_Q : std_logic_vector(w-1 downto 0):= (others => 'X');
variable vExp_OP_Q : std_logic_vector(w-1 downto 0):= (others => 'X');
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

	
	  write(out_line, comment);
	  writeline(out_file, out_line);
	  
	  write(xout_line, xcomment);
	  writeline(xout_file, xout_line);

	  
	ELSE      --Begin processing


		read(in_line, vreset );
		reset  <= vreset;

		read(in_line, vEN );
		EN  <= vEN;

		read(in_line, vOP_A );
		op_A  <= vOP_A;

		read(exo_line, vExp_OP_Q );
		read(exo_line, vTest_OP_Q );
		
    vlinenumber :=LineNumber;
    
    write(out_line, vlinenumber);
    write(out_line, STRING'("."));
    write(out_line, STRING'("    "));

	

    CYCLE(1,CLK);
    
    Exp_OP_Q <= vExp_OP_Q;
    
      
    if (Exp_OP_Q = OP_Q) then
      Test_OP_Q <= '0';
    else
      Test_OP_Q <= 'X';
    end if;

		vOP_Q 	:= OP_Q;
		vTest_OP_Q:= Test_OP_Q;
          		
		write(out_line, vOP_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line,vTest_OP_Q, left, 5);                           --ht is ascii for horizontal tab
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line, vExp_OP_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		writeline(out_file, out_line);
		print(xout_file,    str(LineNumber)& "." & "    " &    str(OP_Q) & "          " &   str(Exp_OP_Q)  & "          " & str(Test_OP_Q) );
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_n_bit_register OF tb_gaire_n_bit_register IS
	FOR TESTBENCH
		FOR Instgaire_n_bit_register: gaire_n_bit_register
			use entity work.gaire_n_bit_register(arch_n_bit_register);
		END FOR;
	END FOR;
END;
