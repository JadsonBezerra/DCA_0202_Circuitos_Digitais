library ieee;
use ieee.std_logic_1164.all;

entity cofre is
port(entrada: in std_logic_vector (7 downto 0);
     reset: in std_logic;
	  cs: in std_logic;
	  clk: in std_logic;
	  E: in std_logic;
	  
	  bloq: out std_logic;
	  abre: out std_logic;
	  modo: out std_logic);
	  end cofre;
	

architecture cofre of cofre is
	
component FFD is
port(D, E: in std_logic;
     clock: in std_logic;
	  Q, Qbar: out std_logic);
end component;	  

	  signal QSaida: std_logic;
	  signal SenhaSalva: std_logic_vector(7 downto 0);
	  signal COMP: std_logic_vector(7 downto 0);
	  signal COMPesult: std_logic;
	  signal Signalbloq: std_logic;
begin

   FFD0: ffd port map(entrada(0), '0', cs, SenhaSalva(0));	  
   FFD1: ffd port map(entrada(1), '0', cs, SenhaSalva(1));	 
   FFD2: ffd port map(entrada(2), '0', cs, SenhaSalva(2));	 
   FFD3: ffd port map(entrada(3), '0', cs, SenhaSalva(3));	 
   FFD4: ffd port map(entrada(4), '0', cs, SenhaSalva(4));	 
   FFD5: ffd port map(entrada(5), '0', cs, SenhaSalva(5));	 
   FFD6: ffd port map(entrada(6), '0', cs, SenhaSalva(6));	 
   FFD7: ffd port map(entrada(7), '0', cs, SenhaSalva(7));	 

   COMP(0) <= SenhaSalva(0) XNOR entrada(0);
	COMP(1) <= SenhaSalva(1) XNOR entrada(1);
	COMP(2) <= SenhaSalva(2) XNOR entrada(2);
	COMP(3) <= SenhaSalva(3) XNOR entrada(3);
	COMP(4) <= SenhaSalva(4) XNOR entrada(4);
	COMP(5) <= SenhaSalva(5) XNOR entrada(5);
	COMP(6) <= SenhaSalva(6) XNOR entrada(6);
	COMP(7) <= SenhaSalva(7) XNOR entrada(7);
	
	COMPesult <= COMP(0) and COMP(1) and COMP(2)and COMP(3)and COMP(4) and COMP(5) and COMP(6) and COMP(7);
	
	FFD8: ffd port map (COMPesult,E, clk , QSaida);
	
	bloq<=Qsaida;
	abre<=not(Qsaida);
	modo<='1';
	
	end cofre;