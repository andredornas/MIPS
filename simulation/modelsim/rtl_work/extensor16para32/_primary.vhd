library verilog;
use verilog.vl_types.all;
entity extensor16para32 is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        x               : out    vl_logic_vector(31 downto 0)
    );
end extensor16para32;
