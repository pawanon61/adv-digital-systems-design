library ieee;
use ieee.std_logic_1164.all;
use work.util_package.all;
entity gaire_barrel_shifter is 
	generic(
		WIDTH: natural;
		S_MODE: natural
	);
	port(
		a: in std_logic_vector(WIDTH-1 downto 0);
		amt: in std_logic_vector(log2c(WIDTH)-1 downto 0);
		y: out std_logic_vector(WIDTH-1 downto 0)
	);
end gaire_barrel_shifter;

architecture para_arch of gaire_barrel_shifter is
	constant STAGE: natural := log2c(WIDTH);
	type std_aoa_type is array(STAGE downto 0) of std_logic_vector(WIDTH-1 downto 0);
	signal p: std_aoa_type;
	component fixed_shifter is
		generic(
			WIDTH: natural;
			S_AMT: natural;
			S_MODE: natural
		);
		port(
			s_in: in std_logic_vector(WIDTH-1 downto 0);
			shft: in std_logic;
			s_out: out std_logic_vector(WIDTH-1 downto 0)
		);
	end component;
begin
	p(0) <= a;
stage_gen:
for s in 0 to (STAGE-1) generate
	shift_slice: fixed_shifter
		generic map(WIDTH=>WIDTH, S_MODE=>S_MODE, S_AMT=>2**s)
		port map(s_in=> p(s), s_out=>p(s+1), shft=>amt(s));
	end generate;
	y <= p(STAGE);
end para_arch;

