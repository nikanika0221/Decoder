
module decoder_module(
   input [31:0] instr,
	input clk,
	input [3:0] flag,
	output reg [1:0] op,
	output reg [3:0] bits,
	output reg [23:0] imminstr,
	output reg [3:0] base,
	output reg [3:0] data_reg,
	output reg [11:0] imminstr_mem,
	output reg jmp_en,
	output reg regjmp_en,
	output reg flag_en,
	output reg write_data,
	output reg memory_data,	
	output reg memdata,
	output reg memdata_en
    );
	 
	 reg m, n, k;
	 
	 always @ (posedge clk)
	 begin
		bits <= instr [24:21];
		op <= instr [27:26];
		m <= instr [20];	
		n <= instr [20];	
		k <= instr [25];
		case (op)
		0:
		begin
			jmp_en <= 0;	
			imminstr <= 0;	
			regjmp_en <= 0;	
			base <= instr [19:16];
			data_reg <= instr [15:12];	
			memory_data <= 0;	
			imminstr_mem <= 0;
			memdata <= 0;
			memdata_en <= 0;
			if (m == 1) flag_en <= 1;
			else flag_en <= 0;
			if (bits == 10) write_data <= 0;
			else write_data <= 1;
		end
		1:
		begin
			jmp_en <= 0;
			regjmp_en <= 0;
			imminstr <= 0;
			flag_en <= 0;
			write_data <= 0;
			base <= instr [19:16];
			data_reg <= instr [15:12];
			memdata_en <= 1;
			if (n == 1)
			begin
				memory_data <= 1;
				memdata <= 0;
				memdata_en <= 1;
			end
			else
			begin
				memory_data <= 0;
				memdata <= 1;
				memdata_en <= 0;
			end
			if (k == 1) imminstr_mem <= instr [11:0];	
			else imminstr_mem <= 0;
		end
		2:
		begin
			jmp_en <= 1;
			regjmp_en <= 1;
			imminstr <= instr [23:0];
			flag_en <= 0;
			write_data <= 0;
			base <= 0;
			data_reg <= 0;
			memory_data <= 0;
			imminstr_mem <= 0;
			memdata <= 0;
			memdata_en <= 0;			
		end
		3:
		begin
			jmp_en <= 0;
			regjmp_en <= 0;
			imminstr <= 0;
			flag_en <= 0;
			write_data <= 0;
			base <= 0;
			data_reg <= 0;
			memory_data <= 0;	
			imminstr_mem <= 0;
			memdata <= 0;
			memdata_en <= 0;
		end
	endcase
	 end
endmodule
