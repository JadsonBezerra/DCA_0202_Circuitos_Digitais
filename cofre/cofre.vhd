library ieee;
use ieee.std_logic_1164.all;

entity cofre is
port (
entrada: in std_logic_vector (7 downto 0);
rst,clk,clock2,cs: in std_logic;
modo,abre,bloqueio: out std_logic
);
end cofre;


architecture cofre of cofre is
	component FFD is
	port(D: in std_logic;
		  clock: in std_logic;
		  Q: out std_logic);	  
	end component;
	
	component REG8 is
	port(entrada: in std_logic_vector (7 downto 0);
     clock: in std_logic;
	  Q: out std_logic_vector (7 downto 0));  
	end component;
	
	component COMP8 is
	port(SenhaSalva: in std_logic_vector (7 downto 0);
	  entrada: in std_logic_vector (7 downto 0);
     clock: in std_logic;
	  Q: out std_logic);
	end component;
	
	signal comparador: std_logic;
	signal SenhaSalva: std_logic_vector(7 downto 0);
	signal Q0,Q1,reset,clock: std_logic; --estado futuro
	signal D0,D1: std_logic; --estado atual
begin
	reset<=not rst;
	clock<=not clk;
	
	REG80: reg8 port map (entrada, cs, SenhaSalva);
	
	COMP80: comp8 port map (SenhaSalva, entrada, clock,comparador);
	
	Q0<=(not D1 and not D0 and not reset and cs) or (not D1 and D0 and cs and not clock) or 
	(not D1 and D0 and not reset and cs and not comparador and clock) or (not D1 and D0 and reset and clock and cs)
	or (D1 and not D0 and reset) or (D1 and D0 and not reset);
	Q1<=(D1 and not reset) or (D0 and not reset and cs and clock);
	modo<= not D1 and not D0;
	abre<=not D1 or D0;
	bloqueio<=D1 and D0;
	
	FFD0: ffd port map (Q0, clock2 , D0);
	FFD1: ffd port map (Q1, clock2 , D1);
	
end cofre;
