library verilog;
use verilog.vl_types.all;
entity MemoriaDeDados is
    generic(
        SIZE            : integer := 32
    );
    port(
        clk             : in     vl_logic;
        Address         : in     vl_logic_vector;
        WriteData       : in     vl_logic_vector;
        ReadData        : out    vl_logic_vector;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end MemoriaDeDados;
