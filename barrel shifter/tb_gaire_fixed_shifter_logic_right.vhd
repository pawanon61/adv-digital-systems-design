LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY tb_gaire_fixed_shifter IS
END;

ARCHITECTURE TESTBENCH OF tb_gaire_fixed_shifter IS
	constant WIDTH: natural := 8;
	constant S_AMT: natural := 3;
	constant S_MODE: natural := 1;	

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

COMPONENT gaire_fixed_shifter  			-- In/out Ports

GENERIC(WIDTH: natural := 8;
	S_AMT: natural := 3;
	S_MODE: natural := 0);
port(
s_in: in std_logic_vector(WIDTH-1 downto 0);
shft: in std_logic;
s_out: out std_logic_vector(WIDTH-1 downto 0)
);
END COMPONENT;



---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"gaire_fixed_shift_logic_right_input.txt";   -- Inputs, reset, enr,enl
FILE exo_file : TEXT open read_mode is 	"gaire_fixed_shift_logic_right_expected_output.txt";   -- Expected output (binary)

FILE out_file : TEXT open  write_mode is  "gaire_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "gaire_Book_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "gaire_Book_hex_out_dacus.txt";

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------

  SIGNAL s_in: STD_LOGIC_VECTOR(WIDTH-1 downto 0):= (OTHERS => 'X');
  SIGNAL shft: STD_LOGIC;
  SIGNAL s_out : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => 'X');
  SIGNAL CLK: STD_LOGIC;
  SIGNAL Exp_s_out : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => 'X');
  SIGNAL Test_s_out : STD_LOGIC:='X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instgaire_fixed_shifter: gaire_fixed_shifter generic map (WIDTH, S_AMT, S_MODE)
port map (s_in, shft, s_out);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line, out_line, xout_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;

variable vs_in   : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vshft : std_logic;
variable vs_out : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vExp_s_out : std_logic_vector(WIDTH-1 downto 0):= (OTHERS => 'X');
variable vTest_s_out : std_logic := '0';
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
	  Test_s_out <= 'Z';
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
	  	  Test_s_out  <= 'Z';
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

		
		read(in_line,vshft);
		shft <= vshft;
		read(in_line, vs_in);
		s_in  <= vs_in;

		read(exo_line, vexp_s_out );
		read(exo_line, vTest_s_out );
		
    vlinenumber :=LineNumber;
    
    write(out_line, vlinenumber);
    write(out_line, STRING'("."));
    write(out_line, STRING'("    "));

	

    CYCLE(1,CLK);
    
    Exp_s_out      <= vexp_s_out;
    
      
    if (Exp_s_out = s_out) then
      Test_s_out <= '0';
    else
      Test_s_out <= 'X';
    end if;

		vs_out 	:= s_out;
		vTest_s_out:= Test_s_out;
          		
		write(out_line, vs_out, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line,vTest_s_out, left, 5);                           --ht is ascii for horizontal tab
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line, vexp_s_out, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		writeline(out_file, out_line);
		print(xout_file,    str(LineNumber)& "." & "    " &    str(s_out) & "          " &   str(Exp_s_out)  & "          " & str(Test_s_out) );
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_tb_gaire_fixed_shifter_logic_right OF tb_gaire_fixed_shifter IS
	FOR TESTBENCH
		FOR Instgaire_fixed_shifter: gaire_fixed_shifter
			use entity work.gaire_fixed_shifter(para_arch);
		END FOR;
	END FOR;
END;

