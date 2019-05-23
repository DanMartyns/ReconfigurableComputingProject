----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2019 12:37:21 PM
-- Design Name: 
-- Module Name: RAMWrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity RAMWrapper is
  Port ( 
    clk: in std_logic;
    datain : in std_logic_vector(31 downto 0);
    dataout : out std_logic_vector(1023 downto 0)         
        );
end RAMWrapper;

architecture Behavioral of RAMWrapper is
    signal vector : std_logic_vector(dataout'range);
    signal address : std_logic_vector(6 downto 0);
    signal we : std_logic;
    signal data: std_logic_vector(23 downto 0);
    signal addr_i : integer range 0 to 999;
begin
    address <= datain(31 downto 25);
    we <= datain(24);
    data <= datain(23 downto 0);
    addr_i <= to_integer(unsigned(address));
RamProc: process(clk) is
    begin
        if rising_edge(clk) and we = '1' then
              vector(addr_i+23 downto addr_i) <= data;
          end if;	
 end process RamProc;
 dataout <= vector;


end Behavioral;
