library verilog;
use verilog.vl_types.all;
entity d_overflow is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        S               : in     vl_logic;
        X               : out    vl_logic
    );
end d_overflow;
