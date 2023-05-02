`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 05:59:18 PM
// Design Name: 
// Module Name: if_neuron2
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


module if_neuron2(
    input clk,
    input reset,
    input spike_in,
    output reg fire_out
);

    parameter threshold = 3'b010;
    reg membrane_potential = 0;
    
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            membrane_potential <= 0;
            fire_out <= 0;
        end else if (spike_in) begin
            membrane_potential <= membrane_potential + 1;
            if (membrane_potential >= threshold) begin
                membrane_potential <= 0;
                fire_out <= 1;
            end
        end else begin
            membrane_potential <= membrane_potential >> 1;
            fire_out <= 0;
        end
    end
    
endmodule






