`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2023 12:50:16 AM
// Design Name: 
// Module Name: if_neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Successful
// 
//////////////////////////////////////////////////////////////////////////////////

module if_neuron (
  input clk,          // Clock signal
  input reset,        // Reset signal
  input spike,        // Input spike signal
 // input threshold,
  output reg fire,    // Output fire signal
  output reg [7:0] potential  // Output membrane potential
);

  parameter threshold = 3;  // Threshold value
  
  reg [2:0] state = 0;  // Neuron state machine state
  reg [4:0] spike_count = 0; // Counter to keep track of consecutive spikes
  
  always @(posedge clk) begin
    if (reset) begin
      potential <= 0;
      fire <= 0;
      state <= 0;
      spike_count <= 0;
    end else begin
    
    //#50 //delay for receiving inputs
      if (spike) begin
        potential <= potential + 1;
        spike_count <= spike_count + 1;
        if (spike_count == threshold) begin
          fire <= 1;
          #50 fire<=0; //hold time for fired neuron
          spike_count <= 0;
          state <= 2;
        end
      end else begin
        potential <= potential - 1;
        spike_count <= 0;
        fire<=0;
        if (potential < 0) begin
          potential <= 0;
        end
      end
      
      // Update state machine
      case (state)
        0: if (spike) state <= 1;
           else state <= 0;
        1: if (spike) state <= 2;
           else state <= 0;
        2: state <= 3;
        3: if (!fire) state <= 0;
           else state <= 3;
        default: state <= 0;
      endcase
      
      // Reset potential and state machine if neuron fired
      if (fire) begin
        potential <= 0;
        state <= 0;
      end
    end
  end
  
endmodule




