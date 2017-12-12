library ieee;
use ieee.std_logic_1164.all;

entity gaire_1_bit_register is
    port (   clk : in std_logic;
            reset : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            OP_A : IN STD_LOGIC;
            OP_Q : OUT STD_LOGIC
        );
end gaire_1_bit_register;

ARCHITECTURE arch_1_bit_register of gaire_1_bit_register is
    signal my_sig : STD_LOGIC;

        begin
            process(clk)
            begin
            if(clk'event and clk = '1') then
                if(reset='1') then
                    my_sig <= '0';
                elsif (EN='1') then
                    my_sig <= OP_A;
                else
                    my_sig <= my_sig;
                end if; -- reset
            end if; -- clk
        OP_Q <= my_sig;
    end process;
end arch_1_bit_register;