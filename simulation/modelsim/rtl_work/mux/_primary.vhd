library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : in     vl_logic;
        x               : out    vl_logic
    );
end mux;
