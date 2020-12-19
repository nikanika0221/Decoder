`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:14:32 12/19/2020
// Design Name:   decoder_module
// Module Name:   D:/Desktop/Xilinx ISE Design Suite 14.5/decoder/testbench.v
// Project Name:  decoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [31:0] instr;
	reg clk;
	reg [3:0] flag;

	// Outputs
	wire [1:0] op;
	wire [3:0] bits;
	wire [23:0] imminstr;
	wire [3:0] base;
	wire [3:0] data_reg;
	wire [11:0] imminstr_mem;
	wire jmp_en;
	wire regjmp_en;
	wire flag_en;
	wire write_data;
	wire memory_data;
	wire memdata;
	wire memdata_en;

	// Instantiate the Unit Under Test (UUT)
	decoder_module uut (
		.instr(instr), 
		.clk(clk), 
		.flag(flag), 
		.op(op), 
		.bits(bits), 
		.imminstr(imminstr), 
		.base(base), 
		.data_reg(data_reg), 
		.imminstr_mem(imminstr_mem), 
		.jmp_en(jmp_en), 
		.regjmp_en(regjmp_en), 
		.flag_en(flag_en), 
		.write_data(write_data), 
		.memory_data(memory_data), 
		.memdata(memdata), 
		.memdata_en(memdata_en)
	);

	always #1 clk = !clk;
	initial begin
		// Initialize Inputs
		instr = 0;
		clk = 0;
		flag = 0;

		// Wait 100 ns for global reset to finish
		#100; instr = 32'b11010011010010010110111111111111;	
		#100; instr = 32'b10010011111001011010011111111111;	
		#100; instr = 32'b11010111111100001000111011000000;	
		#100; instr = 32'b10010101111011000001000011111111;	
		#100; instr = 32'b11101011101010101010101010101010;	
		#100; instr = 32'b11011011010101010101010101010101;	
	end 
endmodule

