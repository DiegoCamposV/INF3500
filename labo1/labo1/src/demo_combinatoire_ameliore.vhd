-------------------------------------------------------------------------------
--
-- demo_combinatoire_ameliore.vhd
--
-- Processeur qui effectue des calculs sur un nombre donnée en entrée.
-- Toutes les fonctions sont purement combinatoires.
--
-- v. 1.0 26/01/2032
-- Nour-El Houda El Hasni & Diego Campos
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demo_combinatoire_ameliore is       
	generic (
	    W : integer := 16 -- nombre de bits pour représenter le nombre
	);
	
	port (
	    A : in unsigned(W - 1 downto 0);
	    pair: out std_logic;        -- indique si le nombre est pair
	    divpar4 : out std_logic;    -- indique si le nombre est divisible par 4
	    divpar5 : out std_logic;    -- indique si le nombre est divisible par 5
	    divpar8 : out std_logic     -- indique si le nombre est divisible par 8
	);
end demo_combinatoire_ameliore;


architecture arch1 of demo_combinatoire_ameliore is
begin                          
    
     pair <= not(A(0));
	
	divpar4 <= not(A(0)) and not(A(1));
    
    with (to_integer(A) mod 5) select
    divpar5 <=
        '1' when 0,
        '0' when others;
	
    divpar8 <= not(A(0)) and not(A(1)) and not(A(2));	
    
end arch1;
