library verilog;
use verilog.vl_types.all;
entity instrucao is
    generic(
        SIZE            : integer := 32
    );
    port(
        ReadAddress     : in     vl_logic_vector(4 downto 0);
        Instruction     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end instrucao;
