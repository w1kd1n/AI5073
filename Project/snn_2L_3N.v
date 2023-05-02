`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 05:57:12 PM
// Design Name: 
// Module Name: snn_2L_3N
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


module SNN_2layer_3IF(
    input clk,
    input reset,
    input [2:0] input_spike,
    output reg [2:0] output_spike
);

    wire [2:0] layer1_fire;
    wire [2:0] layer2_fire;
    
    if_neuron layer1_neuron1(clk, reset, input_spike[0], layer1_fire[0]);
    if_neuron layer1_neuron2(clk, reset, input_spike[1], layer1_fire[1]);
    if_neuron layer1_neuron3(clk, reset, input_spike[2], layer1_fire[2]);
   
    if_neuron layer2_neuron1(clk, reset, layer1_fire[0] + layer1_fire[1] + layer1_fire[2], layer2_fire[0]);
    if_neuron layer2_neuron2(clk, reset, layer1_fire[0] + layer1_fire[1] + 2*layer1_fire[2], layer2_fire[1]);
    if_neuron layer2_neuron3(clk, reset, (layer1_fire[0] + 3*layer1_fire[1]) + layer1_fire[2], layer2_fire[2]);
    
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            output_spike <= 0;
        end else begin
            if (layer2_fire[0]) begin
                output_spike <= 1;
            end else if (layer2_fire[1]) begin
                output_spike <= 2;
            end else if (layer2_fire[2]) begin
                output_spike <= 3;
            end else begin
                output_spike <= 0;
            end
        end
    end
    
endmodule



