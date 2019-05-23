library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity RAM is
    generic (N : integer := 4; M : integer := 4);
    port (
    clock   : in  std_logic;
    we      : in  std_logic;
    address : in  std_logic_vector(N-1 downto 0);
    addressw : in std_logic_vector(N-1 downto 0);
    datain  : in  std_logic_vector(M-1 downto 0);
    dataout : out std_logic_vector(M-1 downto 0)
    );
end entity RAM;

architecture Behavioral of RAM is

   type ram_type is array (0 to (2**N)-1) of std_logic_vector(datain'range);
   signal ram : ram_type;

begin

    RamProc: process(clock) is
        begin
            if rising_edge(clock) and we = '1' then
	              ram(to_integer(unsigned(addressw))) <= datain;
	          end if;	
     end process RamProc;
     dataout <= ram(to_integer(unsigned(address)));
end architecture Behavioral;
