library ieee;
use ieee.std_logic_1164.all;

entity gaire_tri_state_gate is
generic(w:integer:= 16);
port( EN: in std_logic;
	input: in std_logic_vector(w-1 downto 0);
	output: out std_logic_vector(w-1 downto 0)
);
end gaire_tri_state_gate;

architecture arch_tri_state_gate of gaire_tri_state_gate is
begin
	process(EN, input)
	begin
		if(EN = '1') then
			output <= input;
		elsif(EN = '0') then
			output <= (others => 'Z');
		end if;
	end process;
end arch_tri_state_gate;