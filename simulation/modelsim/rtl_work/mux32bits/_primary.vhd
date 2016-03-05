library verilog;
use verilog.vl_types.all;
entity mux32bits is
    generic(
        SIZE            : integer := 32
    );
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic;
        x               : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end mux32bits;
