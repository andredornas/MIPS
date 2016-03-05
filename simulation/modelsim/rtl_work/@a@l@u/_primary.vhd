library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        operation       : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        result          : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end ALU;
