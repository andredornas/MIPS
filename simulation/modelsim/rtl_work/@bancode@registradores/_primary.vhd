library verilog;
use verilog.vl_types.all;
entity BancodeRegistradores is
    generic(
        SIZE            : integer := 32
    );
    port(
        Read1           : in     vl_logic_vector(4 downto 0);
        Read2           : in     vl_logic_vector(4 downto 0);
        WriteReg        : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector;
        RegWrite        : in     vl_logic;
        Data1           : out    vl_logic_vector;
        Data2           : out    vl_logic_vector;
        clock           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end BancodeRegistradores;
