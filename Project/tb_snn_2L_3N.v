`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 05:58:04 PM
// Design Name: 
// Module Name: tb_snn_2L_3N
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


module tb_SNN_2layer_3IF();

    // Inputs
    reg clk=0;
    reg reset;
    reg [2:0] input_spike;

    // Outputs
    wire [2:0] output_spike;

    // Generate clock signal
    always #5 clk = ~clk;

    // Instantiate the Unit Under Test (UUT)
    SNN_2layer_3IF uut (
        .clk(clk),
        .reset(reset),
        .input_spike(input_spike),
        .output_spike(output_spike)
    );



    // Initialize inputs
    initial begin
        reset = 1;
        input_spike = 9'b0;
        #20 reset = 0;
        #10 input_spike = 3'b101;  // 1st input
        #50 input_spike = 3'b111;  // 2nd input
        #50 input_spike = 3'b101;  // 3rd input
        #50 input_spike = 3'b000;  // 4th input
        #50 input_spike = 3'b110;  // 5th input
        #50 input_spike = 3'b110;  // 6th input
        #50 input_spike = 3'b110;  // 7th input
        #50 $finish;
    end

    // Monitor output spikes
    always @(posedge clk) begin
        case (output_spike)
            3'b000: $display("Output spike: 0");
            3'b001: $display("Output spike: 1");
            3'b010: $display("Output spike: 2");
            3'b011: $display("Output spike: 3");
            3'b101: $display("Output spike: 4");
            3'b110: $display("Output spike: 5");
            3'b111: $display("Output spike: 6");
            default: $display("No output spike");
        endcase
    end

endmodule






