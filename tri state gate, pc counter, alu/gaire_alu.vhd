library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity gaire_alu is
	generic(w: integer:= 16);
	port(
	OP_A: in std_logic_vector(w-1 downto 0);
	OP_B: in std_logic_vector(w-1 downto 0);
	sel: in std_logic_vector(1 downto 0);
	OP_Q: out std_logic_vector(w-1 downto 0)
);
end gaire_alu;

architecture arch_alu of gaire_alu is
signal my_sig: std_logic_vector(w-1 downto 0); -- internal signal
begin
	with sel select
		my_sig <= (OP_A + OP_B) when "00",
				(OP_A - OP_B) when "01",
				NOT(OP_A) when "10",
				(OP_A AND OP_B) when others;
	OP_Q <= my_sig(w-1 downto 0);
end arch_alu;