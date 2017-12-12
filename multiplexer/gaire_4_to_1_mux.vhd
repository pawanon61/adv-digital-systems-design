library ieee;
use ieee.std_logic_1164.all;
entity gaire_4_to_1_multiplexer is
	port(
		a_0: in std_logic_vector(15 downto 0);
		a_1: in std_logic_vector(15 downto 0);
		a_2: in std_logic_vector(15 downto 0);
		a_3: in std_logic_vector(15 downto 0);
		y: out std_logic_vector(15 downto 0);
		sel: in std_logic_vector(1 downto 0));
end gaire_4_to_1_multiplexer;

architecture arch_4_to_1_multiplexer of gaire_4_to_1_multiplexer is
begin
	with sel select
		y <= a_0 when "00",
		     a_1 when "01",
		     a_2 when "10",
		     a_3 when others; 
end arch_4_to_1_multiplexer;

