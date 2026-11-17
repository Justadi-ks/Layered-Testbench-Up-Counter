`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2026 19:38:50
// Design Name: 
// Module Name: up_counter
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
module up_counter (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);
    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end
endmodule

