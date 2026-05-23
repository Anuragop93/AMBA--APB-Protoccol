module apb_tb;
  reg PCLK;           // Clock signal
  reg PRESETn;        // Active-low reset signal
  reg PSELx;          // Chip select signal
  reg PENABLE;        // Enable signal
  reg PWRITE;         // Write enable signal
  reg [31:0] PADDR;   // Address for memory access
  reg [31:0] PWDATA;  // Data to be written into memory
  wire [31:0] PRDATA; // Data read from memory
  wire PREADY;        // Ready signal indicating when the module is ready to accept or provide data

  // Instantiate the DUT (Design Under Test)
  apb_slave dut (
      .PCLK(PCLK),        // Connects PCLK to DUT
      .PRESETn(PRESETn),  // Connects PRESETn to DUT
      .PSELx(PSELx),      // Connects PSELx to DUT
      .PENABLE(PENABLE),  // Connects PENABLE to DUT
      .PWRITE(PWRITE),    // Connects PWRITE to DUT
      .PADDR(PADDR),      // Connects PADDR to DUT
      .PWDATA(PWDATA),    // Connects PWDATA to DUT
      .PRDATA(PRDATA),    // Connects PRDATA from DUT
      .PREADY(PREADY)     // Connects PREADY from DUT
  );

  initial begin
      // Initializing signals
      PCLK = 0;
      PRESETn = 0;
      PSELx = 0;
      PENABLE = 0;
      PWRITE = 0;
      PADDR = 32'd0;
      PWDATA = 32'd0;
      $dumpfile("apb_tb.vcd");
      $dumpvars(0, apb_tb);
      #5;
      PRESETn = 1;
  
      // Write cycle
      #5;
      PSELx = 1;
      PENABLE = 1;
      PWRITE = 1;
      PADDR = 32'd0;
      PWDATA = 32'h00001234;

      #10;
      PENABLE = 0;
      PSELx = 0;
      PWRITE = 0;

      // Read cycle
      #5;
      PSELx = 1;
      PENABLE = 1;
      PWRITE = 0;
      PADDR = 32'd0;

      #10;
      PENABLE = 0;
      PSELx = 0;

      #10;
      $finish;
  end

  // Clock generation
  always #5 PCLK = ~PCLK;

  initial begin
      $monitor("Time: %0t | CLK: %b | RESETn: %b | PADDR: %h | PWDATA: %h | PWRITE: %b | PSELx: %b | PENABLE: %b | PRDATA: %h | PREADY: %b",
               $time, PCLK, PRESETn, PADDR, PWDATA, PWRITE, PSELx, PENABLE, PRDATA, PREADY);
      $dumpfile("apb_tb.vcd");
      $dumpvars(0, apb_tb);
  end

  initial begin
      $display("Starting APB Testbench Simulation");
      $display("=================================");
  end
endmodule
