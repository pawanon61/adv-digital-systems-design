library ieee;
use work.CLOCKS.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

-- this is for 5 to 16 bit sign extender
entity gaire_5_to_16_bit_sign_extender is                                           generic (p: integer:= 16;   
         w: integer:= 5);
port (clk: in std_logic;   
      reset: in std_logic;
      OP_A: in std_logic_vector(w-1 downto 0);
      OP_Q: out std_logic_vector(p-1 downto 0) 
      );
end gaire_5_to_16_bit_sign_extender;                                                  

architecture bhv of gaire_5_to_16_bit_sign_extender is                             
	
	signal my_sig: std_logic_vector(p-1 downto 0);
	begin              
	process(clk)
         begin
            if(clk'event and clk ='1') then
               if(reset = '1') then
				my_sig <= (others => '0');
               elsif(OP_A(w-1) = '0') then
                     my_sig(p-1 downto w) <= (others => '0');
				my_sig(w-1 downto 0) <= op_A;
               else
                     my_sig(p-1 downto w) <= (others => '1');
				my_sig(w-1 downto 0) <= OP_A;
               end if;
		   end if;
       end process;
	OP_Q <= my_sig;
end bhv;
