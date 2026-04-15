`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 21:40:14
// Design Name: 
// Module Name: Alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Code your testbench here
// or browse Examples
module test;
  reg [15:0] A,B;
  reg [2:0] opcode;
  wire zero,carry, overflow;
  wire [31:0] result;
  integer k;
  ALU normal(.opcode(opcode),.result(result),.zero(zero),.A(A),.B(B),.carry(carry),.overflow(overflow));
  initial begin
    $dumpfile("dumb.vcd");
    $dumpvars(1);
    for(k=0; k<8; k=k+1)
      begin
        #5 opcode=k;
        A=16'hf142;
        B=16'hffff;
        #5 $display("opcode:%d  A:%h    B:%h result: %h   carry:%b  zero:%b   overflow:%b", k,A,B, result,carry,zero, overflow );
      end
    
  end
endmodule
  