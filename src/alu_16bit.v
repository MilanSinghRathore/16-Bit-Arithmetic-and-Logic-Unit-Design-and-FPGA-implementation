`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 21:39:15
// Module Name: 16-bit  Alu
// Project Name: 16-Bit Airthmetic and Logical Unit with 3 flag register

// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*This is the code for the 16-Bit Arithmetic and logical unit with 3 flags that are carry, overflow and zero flag.
Designed by Milan Singh Rathore.

----------------------------------------------------------------------*/
module ALU(opcode, result,zero,overflow, A,B,carry);
  input [15:0] A,B;
  input[2:0] opcode;
  output reg [31:0] result;
  output reg zero,carry,overflow;
  
  reg [16:0] temp_result;
  always @(*)
    begin
    result=0;
    carry=0;
    overflow=0;
    
      case (opcode)
        3'b000: begin
          temp_result= A+B;// if opcode is 0; then addition perform.
                overflow = (~A[15] & ~B[15] & temp_result[15]) | (A[15] & B[15] & ~temp_result[15]);
                carry=temp_result[16];
                result[15:0]=temp_result[15:0];
        end

        3'b001:begin
          temp_result= A-B;//if opcode is 1; then substraction perform.
            overflow = (~A[15] & B[15] & temp_result[15]) | (A[15] & ~B[15] & ~temp_result[15]);
             carry=temp_result[16];
                result[15:0]=temp_result[15:0];     
        end

        3'b010:  begin
          result= A * B;//if opcode is 2; then logical and operation perform.
                 overflow=1'b0;
        end

        3'b011:  begin
             if (B!=0)begin
                 result[15:0]= A/B;// if opcode is 3; then logical xor will perform of two number A with B.
                  overflow=1'b0;
                  end
                  else 
                  result=0;
        end

        3'b100: begin
          result= A|B;//if opcode is 4; then or operation will perform.
                 overflow=1'b0;  
                 carry=0;
        end

        3'b101: begin
                 result = ~A;// if opcode is 5; then not operation of A will perform.
                 overflow=1'b0;
                 carry=1'b0;
        end

        3'b110: begin
                result= ~B;// if opcode is 6; then not operation of B will perform.
                overflow=1'b0;
                carry=1'b0;
        end

        3'b111: begin  result= (A>B)? 1'b1: 1'b0;// if opcode is 7; then A is greater than B or not  will check.
                  overflow=1'b0;
                  carry=1'b0;
        end

        default:  begin
              result=32'b0000;
         overflow=1'b0;
            end
      endcase
      zero=(result==32'b0)? 1'b1: 1'b0;// it checks the result is zero or not.
     
    end
endmodule

module alu_fpga_top(

    input clk,
    input [15:0] sw,
    input [3:0] pb,     // pb[3] added for flag display
    output [15:0] led,
    output carry,
    output overflow,
    output zero
);

/////////////////////
// Registers
/////////////////////

reg [15:0] A_reg = 0;
reg [15:0] B_reg = 0;
reg [2:0] opcode_reg = 0;
reg display_sel = 0;

wire [31:0] result_wire;

/////////////////////
// Control Logic
/////////////////////

always @(posedge clk)
begin
    if(pb[0])
        A_reg <= sw;

    if(pb[1])
        B_reg <= sw;

    if(pb[2])
        display_sel <= ~display_sel;

    opcode_reg <= sw[2:0];
end

/////////////////////
// ALU Instance
/////////////////////

ALU uut (
    .A(A_reg),
    .B(B_reg),
    .opcode(opcode_reg),
    .result(result_wire),
    .carry(carry),
    .overflow(overflow),
    .zero(zero)
);

/////////////////////
// LED Display Logic
/////////////////////

wire [15:0] result_display;

assign result_display = (display_sel) ?
                        result_wire[31:16] :
                        result_wire[15:0];

/////////////////////
// FLAG DISPLAY CONTROL
/////////////////////

assign led = (pb[3]) ? 
             {13'b0, carry, overflow, zero} : 
             result_display;

endmodule
