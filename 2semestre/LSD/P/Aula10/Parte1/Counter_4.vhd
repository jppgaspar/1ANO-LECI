library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter_4 is
	port(clk : in std_logic;
		  count : out std_logic_vector(3 downto 0));
end Counter_4;

architecture Behavioral of Counter_4 is
	signal s_count : unsigned(3 downto 0);
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			s_count <= s_count + 1;
		end if;
	end process;
	count <= std_logic_vector(s_count);
end Behavioral;