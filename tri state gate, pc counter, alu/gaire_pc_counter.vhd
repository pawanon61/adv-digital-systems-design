library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity gaire_program_counter is
	generic(w: integer := 16);
	port(clk: in std_logic;
	reset: in std_logic;
	EN: in std_logic;
	OP_A: in std_logic_vector(w-1 downto 0);
	OP_Q: out std_logic_vector(w-1 downto 0);
	OP_Z: out std_logic_vector(w-1 downto 0)
);
end gaire_program_counter;

architecture arch_program_counter of gaire_program_counter is
signal your_sig: std_logic_vector(w-1 downto 0):=(others => '0');
signal my_sig: std_logic_vector(w-1 downto 0);
begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if (reset = '1') then
				my_sig <= (others => '0');
				your_sig <= your_sig + 1;
			elsif(EN = '1') then
				my_sig <= OP_A;
				your_sig <= OP_A + 1;
			else
				my_sig <= my_sig;
				your_sig <= your_sig;
			end if;
		end if;
	end process;
OP_Q <= my_sig;
OP_Z <= your_sig;
end arch_program_counter;