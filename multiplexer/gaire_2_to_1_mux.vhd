library ieee;
use ieee.std_logic_1164.all;
entity gaire_2_to_1_multiplexer is
	port(
		a_0: in std_logic_vector(15 downto 0);
		a_1: in std_logic_vector(15 downto 0);
		y: out std_logic_vector(15 downto 0);
		sel: in std_logic);
end gaire_2_to_1_multiplexer;

architecture arch_2_to_1_multiplexer of gaire_2_to_1_multiplexer is
begin
	with sel select
		y <= a_0 when '0',
		     a_1 when others;
end arch_2_to_1_multiplexer;
