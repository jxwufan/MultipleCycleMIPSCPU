`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:55 05/24/2015
// Design Name:   sccpu_dataflow
// Module Name:   /home/fan/code/test/SCCPU/testcpu.v
// Project Name:  SCCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sccpu_dataflow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testcpu;

	// Inputs
	reg clock;
	reg resetn;
	reg [31:0] mem;
	
	// Outputs
	wire [31:0] pc;
	wire wmem;
	wire [31:0] alu_out;
	
	wire [31:0] rom [0:31];
	
	wire [31:0] npc;
	wire [1:0] pcsource;
	wire [31:0] alua, alub;
	wire [3:0] aluc;
	wire [31:0] opa, rega;
	wire z;
	wire [2:0] state;
	wire selpc;
	wire [31:0] inst, tomem;
	wire [31:0] res, madr;
	
	wire wreg;
	wire [4:0] wn;

	assign rom[0] = 32'h3c08f000;

	assign rom[1] = 32'h31290000;

	assign rom[2] = 32'h2129000f;
	assign rom[3] = 32'h21080046;
	assign rom[4] = 32'had090000;
	assign rom[5] = 32'h08000000;
	assign rom[6] = 32'h08000000;
	assign rom[7] = 32'h08000000;
	assign rom[8] = 32'h08000000;
	assign rom[9] = 32'h08000000;
	assign rom[10] = 32'h08000000;
	assign rom[11] = 32'h08000000;
	assign rom[12] = 32'h08000000;
	assign rom[13] = 32'h08000000;
	assign rom[14] = 32'h08000000;
	assign rom[15] = 32'h08000000;
	assign rom[16] = 32'h08000000;
	assign rom[17] = 32'h08000000;
	assign rom[18] = 32'h08000000;
	assign rom[19] = 32'h08000000;
	assign rom[20] = 32'h08000000;
	assign rom[21] = 32'h08000000;
	assign rom[22] = 32'h08000000;
	assign rom[23] = 32'h08000000;
	assign rom[24] = 32'h08000000;
	assign rom[25] = 32'h08000000;
	assign rom[26] = 32'h08000000;
	assign rom[27] = 32'h08000000;
	assign rom[28] = 32'h08000000;
	assign rom[29] = 32'h08000000;
	assign rom[30] = 32'h08000000;
	assign rom[31] = 32'h08000000;
	assign rom[32] = 32'h08000000;
	

	// Instantiate the Unit Under Test (UUT)
	
	mccpu uut (
	 .madr(madr),
    .clock(clock), 
    .resetn(resetn), 
    .frommem(mem), 
    .pc(pc), 
    .inst(inst), 
    .alu_out(alu_out),
	 .npc(npc),
	 .pcsource(pcsource),
	 .alua(alua),
	 .alub(alub),
	 .aluc(aluc),
	 .z(z),
	 .opa(opa),
	 .rega(rega),
	 .state(state),
	 .selpc(selpc),
	 .res(res),
	 .wreg(wreg),
	 .wn(wn),
	 .wmem(wmem),
	 .tomem(tomem)
    );

	integer i;
	initial begin
		// Initialize Inputs
		clock = 0;
		resetn = 0;
		mem = 0;

		// Wait 100 ns for global reset to finish
		#40;
      resetn = 1;
		#10;
		resetn = 0;
		#40;
		// Add stimulus here
		for (i = 0; i < 200; i = i + 1)
		begin
			mem = 0;
			clock = !clock;
			if (clock == 1) mem = rom[pc >> 2];
			#10;
		end
	end
      
endmodule

