module pes_rr_arbiter(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
  input clk,          // Clock input
  input rst,          // Reset input
  input [3:0] req,    // Request signals from 4 requestors
  output wire [3:0] grant, // Grant signals to 4 requestors
  output wire [3:0] io_oeb
);

assign io_oeb = 4'b0000;

reg [3:0] round_robin_ptr; // Pointer to the next requestor to grant
reg [3:0] grant_reg;      // Registered grant signals

`ifdef COCOTB_SIM
	initial begin
		$dumpfile("pes_rr_arbiter.vcd");
		$dumpvars (0, pes_rr_arbiter);
		#1;
	end
		localparam MAX_COUNT =100;
	`else
		localparam MAX_COUNT=100;
`endif
	

always @(posedge clk or posedge rst) 
begin
  if (rst) 
	  begin
	    round_robin_ptr <= 4'b0000; // Reset the pointer
	    grant_reg <= 4'b0000;      // Reset the registered grants
	  end 
  else
       begin
	    // Round-robin logic
		if (req === 4'b0000) 
		    begin
		      // No requests, no grants
		      round_robin_ptr <= 4'b0000;
		    end 
        	else
		    begin
		      round_robin_ptr <= round_robin_ptr + 1'b1;
		      // Wrap around when all requestors have been cycled through
			      if (round_robin_ptr == 4'b1000) 
				      begin
				      round_robin_ptr <= 4'b0000;
				      end
		    end
		    // Set the registered grant based on the round-robin pointer
		    grant_reg <= (round_robin_ptr == 4'b0000) ? req : 4'b0000;
	end
end

assign grant = grant_reg;

endmodule
