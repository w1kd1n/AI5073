`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 11:25:48 PM
// Design Name: 
// Module Name: lif_neuron2
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

module lif_neuron2
#(
    parameter TAU_M = 20, // membrane time constant
    parameter VTH = 100, // spike threshold
    parameter V_RESET = 0 // reset potential
)
(
    input clk,
    input rst,
    input [99:0] synapse_data,
    output reg spike
);

reg [7:0] v_mem = 0; // membrane potential

integer i;
integer count = 0; // input count

always @(posedge clk) begin
    if (rst) begin
        v_mem <= V_RESET;
        spike <= 0;
        count <= 0;
    end else begin
        if (count == 5) begin // spike and reset
            v_mem <= V_RESET;
            spike <= 1;
            count <= 0;
        end else begin // integration
            for (i = 0; i < 100; i = i+1) begin
                if (synapse_data[i] != 0) begin
                    v_mem <= v_mem + synapse_data[i];
                    count <= count + 1;
                end
            end
            if (v_mem >= VTH) begin // spike and reset
                v_mem <= V_RESET;
                spike <= 1;
                count <= 0;
            end else begin // leakage
                v_mem <= v_mem * (TAU_M - 1) / TAU_M;
                spike <= 0;
            end
        end
    end
end

endmodule


