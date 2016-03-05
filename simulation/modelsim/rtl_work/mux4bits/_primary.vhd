library verilog;
use verilog.vl_types.all;
entity mux4bits is
    generic(
        SIZE            : integer := 4
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        s               : in     vl_logic;
        x               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end mux4bits;
