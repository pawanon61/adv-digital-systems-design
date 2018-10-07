-----------------------testbench LC-3 ------------------------------
--==================================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity DATAPATH_ALL_TB is
end DATAPATH_ALL_TB;


architecture TB1 of DATAPATH_ALL_TB is

component Data_Path_ALL is
port (
	CLK: in std_logic;  
	Reset: in std_logic
     );
end component Data_Path_ALL;

signal	CLKtb		: std_logic; 				
signal	Resettb	: std_logic;				

begin

CLK_GEN: process 
begin 
while now <= 300 ns loop 
CLKtb <='0'; wait for 5 ns; CLKtb <='1'; wait for 5 ns; 
end loop; 
wait; 
end process; 

Reset: process
begin
Resettb  <='1','0' after 2 ns;
wait;
end process;


--------------------------------------do not change-----------------------------------------------
datap: Data_Path_ALL port map ( CLK=>CLKtb, Reset=>Resettb);

end TB1;

configuration CFG_DATAPATH_ALL_TB of DATAPATH_ALL_TB is
	for TB1
	end for;
end CFG_DATAPATH_ALL_TB;