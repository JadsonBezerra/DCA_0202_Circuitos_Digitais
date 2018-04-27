library ieee;
use ieee.std_logic_1164.all;

entity ffd is
port(D: in std_logic;
     clock: in std_logic;
	  Q: out std_logic);
	  end ffd;
	  
	  
architecture ffd of ffd is
signal QSignal: std_logic;
begin

     process(clock)	  
	  begin
	  if (clock'event and clock = '1') then 
	       QSignal<= D;
	  end if;
	 end process;
	  Q<= QSignal;
 end ffd;