library ieee;
use ieee.std_logic_1164.all;

entity gaire_n_bit_register is
    generic(
            W: Integer := 16
    );
    port (  clk : in std_logic;
            reset : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            OP_A : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);
            OP_Q : OUT STD_LOGIC_vector(W-1 DOWNTO 0)
        );
end gaire_n_bit_register;

ARCHITECTURE arch_n_bit_register of gaire_n_bit_register is
    signal my_sig : STD_LOGIC_vector(w-1 DOWNTO 0);

        begin
            process(clk)
            begin
            if(clk'event and clk = '1') then
                if(reset='1') then
                    my_sig <= (others => '0');
                elsif (EN='1') then
                    my_sig <= OP_A;
                else
                    my_sig <= my_sig;
                end if; -- reset
            end if; -- clk
        op_q <= my_sig;
    end process;
end arch_n_bit_register;
