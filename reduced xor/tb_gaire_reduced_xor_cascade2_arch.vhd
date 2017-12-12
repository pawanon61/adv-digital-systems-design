

LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_reduced_xor IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_reduced_xor IS


---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT gaire_reduced_xor  			-- In/out Ports
	port(
a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
y: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_reduced_xor_datain.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_reduced_xor_expected_output.txt";   -- Expected output (binary)

FILE out_file : TEXT open  write_mode is  "AMOO_EVENPD_Book_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "AMOO_EVENPD_Book_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "AMOO_EVENPD_Book_hex_out_dacus.txt";

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL a: STD_LOGIC_VECTOR(7 downto 0):= "XXXXXXXX";
  SIGNAL CLK: STD_LOGIC;	
  SIGNAL y : STD_LOGIC:= 'X';
  SIGNAL Exp_y : STD_LOGIC:= 'X';
  SIGNAL Test_y : STD_LOGIC:= 'X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_reduced_xor: gaire_reduced_xor port map (a, y);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line, out_line, xout_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable va   : std_logic_vector(7 downto 0):= (OTHERS => 'X');
variable vy : std_logic:= '0';
variable vExp_y : std_logic:= '0';
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

	
	  write(out_line, comment);
	  writeline(out_file, out_line);
	  
	  write(xout_line, xcomment);
	  writeline(xout_file, xout_line);

	  
	ELSE      --Begin processing


		read(in_line, va );
		a  <= va;

		read(exo_line, vexp_y );
		read(exo_line, vTest_y );
		
    vlinenumber :=LineNumber;
    
    write(out_line, vlinenumber);
    write(out_line, STRING'("."));
    write(out_line, STRING'("    "));

	

    CYCLE(1,CLK);
    
    Exp_y      <= vexp_y;
    
      
    if (Exp_y = y) then
      Test_y <= '0';
    else
      Test_y <= 'X';
    end if;

		vy 	:= y;
		vTest_y:= Test_y;
          		
		write(out_line, vy, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line,vTest_y, left, 5);                           --ht is ascii for horizontal tab
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line, vexp_y, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		writeline(out_file, out_line);
		print(xout_file,    str(LineNumber)& "." & "    " &    str(y) & "          " &   str(Exp_y)  & "          " & str(Test_y) );
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_reduced_xor_cascade2_arch OF tb_gaire_reduced_xor IS
	FOR TESTBENCH
		FOR Instgaire_reduced_xor: gaire_reduced_xor
			use entity work.gaire_reduced_xor(cascade2_arch);
		END FOR;
	END FOR;
END;

