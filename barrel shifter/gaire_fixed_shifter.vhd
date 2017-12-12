
library ieee;
use ieee.std_logic_1164.all;

library modelsim_lib;
use modelsim_lib.util.all;


entity gaire_fixed_shifter is
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
end gaire_fixed_shifter;
architecture para_arch of gaire_fixed_shifter is 
	constant L_SHIFT: natural :=0;
	constant R_SHIFT: natural :=1;
	constant L_ROTAT: natural :=2;
	constant R_ROTAT: natural :=3;
signal sh_tmp, zero: std_logic_vector(WIDTH-1 downto 0);
begin
	zero <= (others=> '0');

	l_sh_gen:
	if S_MODE=L_SHIFT generate
		sh_tmp <= s_in(WIDTH-S_AMT-1 downto 0) & zero(WIDTH-1 downto WIDTH-S_AMT);

	end generate;

	l_rt_gen:
	if S_MODE=L_ROTAT generate 
		sh_tmp <= s_in(WIDTH-S_AMT-1 downto 0)& s_in(WIDTH-1 downto WIDTH-S_AMT);
	end generate;

	r_Sh_gen:
	if S_MODE=R_SHIFT generate
		sh_tmp <= zero (S_AMT-1 downto 0) & s_in(WIDTH-1 downto S_AMT);
	end generate;

	r_rt_gen:
	if S_MODE=R_ROTAT generate 
		sh_tmp <= s_in(S_AMT-1 downto 0) & s_in(WIDTH-1 downto S_AMT);
	end generate;
	--2-to-1 multiplexer;
	s_out <= sh_tmp when shft= '1' else s_in;
end para_arch;
