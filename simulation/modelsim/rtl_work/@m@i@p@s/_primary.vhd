library verilog;
use verilog.vl_types.all;
entity MIPS is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end MIPS;
