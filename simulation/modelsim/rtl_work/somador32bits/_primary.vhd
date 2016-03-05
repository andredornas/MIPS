library verilog;
use verilog.vl_types.all;
entity somador32bits is
    generic(
        SIZE            : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        s               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end somador32bits;
