library ieee;
use ieee.std_logic_1164.all;

entity gaire_n_bit_register is
    generic(
            w: Integer := 16
    );
    port (  CLK : in std_logic;
            reset : IN STD_LOGIC;
            EN : IN STD_LOGIC;
            OP_A : IN STD_LOGIC_VECTOR(w-1 DOWNTO 0);
            OP_Q : OUT STD_LOGIC_vector(w-1 DOWNTO 0)
        );
end gaire_n_bit_register;

ARCHITECTURE arch_n_bit_register of gaire_n_bit_register is
    signal my_sig : STD_LOGIC_vector(w-1 DOWNTO 0);

        begin
            process(CLK)
            begin
            if(clk'event and CLK = '1') then
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

-------------------------------------------------------
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity gaire_register_array is
generic(w: integer:= 16;
        p: integer := 3;
        E: natural := 8
);
port(CLK: in std_logic;
    reset: in std_logic;
    LD_REG: in std_logic; -- enable to tell us which register in the array is active for input
    DR: in std_logic_vector(p-1 downto 0);
    OP_A: in std_logic_vector(w-1 downto 0);
    SR1: in std_logic_vector(p-1 downto 0);
    SR2: in std_logic_vector(p-1 downto 0);
    OP_Q1: out std_logic_vector(w-1 downto 0);
    OP_Q2: out std_logic_vector(w-1 downto 0)
);
end gaire_register_array;

architecture arch_genreg of gaire_register_array is
type regaray is array(E-1 downto 0) of std_logic_vector(w-1 downto 0);
signal sEN: std_logic_vector(E-1 downto 0);
signal sFF: regaray;

component gaire_n_bit_register
generic(w: integer:= 16);
port(CLK: in std_logic;
    reset: in std_logic;
    EN: in std_logic;
    OP_A: in std_logic_vector(w-1 downto 0);
    OP_Q: out std_logic_vector(w-1 downto 0)
);
end component;

begin
    p0: process(DR, LD_REG)
    begin
        sEN <= (sEN'range => '0');
        sEN(to_integer(unsigned(DR))) <= LD_REG;
    end process;
    g0: for j in 0 to (E-1) generate
        regh0: gaire_n_bit_register port map (CLK, Reset, sEN(j), OP_A, sFF(j));
    end generate;
OP_Q1 <= sFF(to_integer(unsigned(SR1)));
OP_Q2 <= sFF(to_integer(unsigned(SR2)));

end arch_genreg;

