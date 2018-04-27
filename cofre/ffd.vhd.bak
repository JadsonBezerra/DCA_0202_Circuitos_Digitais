library ieee;
use ieee.std_logic_1164.all;

entity ffd is
port(D, E: in std_logic;
     clock: in std_logic;
	  Q, Qbar: out std_logic);
	  end ffd;
	  
architecture ffd of ffd is
signal QSignal: std_logic;
begin

     process(clock)	  
	  begin
	  if (clock'event and clock = '0' and E = '0') then 
	       QSignal<= D;
	  end if;
	 end process;
	  Q<= QSignal;
	  QBar<= not Qsignal;
 end ffd;