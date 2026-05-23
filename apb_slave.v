  // DESIGN

module apb_slave (
    input wire PCLK,          // Clock signal
    input wire PRESETn,       // Active-low reset signal
    input wire PSELx,         // Chip select signal
    input wire PENABLE,       // Enable signal
    input wire PWRITE,        // Write enable signal
    input wire [31:0] PADDR,  // Address for memory access
    input wire [31:0] PWDATA, // Data to be written into memory
    output reg [31:0] PRDATA, // Data read from memory
    output reg PREADY         // Ready signal indicating when the module is ready to accept or provide data
);

  reg [31:0] memory [0:255];  // An array memory of 256 registers (each 32 bits wide) is used to simulate memory storage.

    // READ and WRITE OPERATIONS : - 
    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
          
            // Reset state: Clear outputs and set ready signal
            PRDATA <= 32'd0;
            PREADY <= 1'b1;
        end else begin
            // 1. Normal operation
            if (PSELx && PENABLE) begin
                if (PWRITE) begin
                    // 2. WRITE OPERATION : Store PWDATA into memory at address PADDR
                    memory[PADDR] <= PWDATA;
                    PREADY <= 1'b1;
                end else begin
                    // 3. READ OPERATION : Load data from memory at address PADDR into PRDATA
                    PRDATA <= memory[PADDR];
                    PREADY <= 1'b1;
                end
            end else begin
              // 4. IDLE STATE ( when not selected ) : Set ready signal high
                PREADY <= 1'b1;
            end
        end
    end
endmodule
