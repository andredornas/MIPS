library verilog;
use verilog.vl_types.all;
entity mux3bits4entradas is
    port(
        and1            : in     vl_logic_vector(31 downto 0);
        or1             : in     vl_logic_vector(31 downto 0);
        adder1          : in     vl_logic_vector(31 downto 0);
        slt             : in     vl_logic_vector(31 downto 0);
        operation       : in     vl_logic_vector(2 downto 0);
        x               : out    vl_logic_vector(31 downto 0)
    );
end mux3bits4entradas;
