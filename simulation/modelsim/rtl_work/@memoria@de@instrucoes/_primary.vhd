library verilog;
use verilog.vl_types.all;
entity MemoriaDeInstrucoes is
    generic(
        SIZE            : integer := 32
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Instruction     : out    vl_logic_vector;
        SaidaPC         : out    vl_logic_vector(4 downto 0);
        EntradaPC       : in     vl_logic_vector(4 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end MemoriaDeInstrucoes;
