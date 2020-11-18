library verilog;
use verilog.vl_types.all;
entity uart_drive is
    generic(
        CLK_FRE         : integer := 50;
        BAUD_RATE       : integer := 115200
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        dec             : in     vl_logic_vector(19 downto 0);
        sign            : in     vl_logic_vector(7 downto 0);
        uart_we         : in     vl_logic;
        tx_reg          : out    vl_logic;
        uart_end        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FRE : constant is 1;
    attribute mti_svvh_generic_type of BAUD_RATE : constant is 1;
end uart_drive;
