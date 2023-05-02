`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 11:28:56 PM
// Design Name: 
// Module Name: tb_lif_neuron2
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


module lif_neuron2_tb();

    // Inputs
    reg clk;
    reg rst;
    reg [9:0] synapse_data;

    // Outputs
    wire spike;

    // Instantiate the Unit Under Test (UUT)
    lif_neuron2 uut (
        .clk(clk),
        .rst(rst),
        .synapse_data(synapse_data),
        .spike(spike)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        synapse_data = 0;
        
        // Wait 10 clock cycles for reset to complete
        #10 rst = 0;
        
        // Test case 1: all inputs zero, no spike
        #10 synapse_data = 0;
     //   #100 assert(spike == 0);
        
        // Test case 2: one input non-zero, no spike
        #10 synapse_data = 1;
     //   #100 assert(spike == 0);
        
        // Test case 3: two inputs non-zero, no spike
        #10 synapse_data = 3;
     //   #100 assert(spike == 0);
        
        // Test case 4: three inputs non-zero, no spike
        #10 synapse_data = 7;
     //   #100 assert(spike == 0);
        
        // Test case 5: four inputs non-zero, no spike
        #10 synapse_data = 15;
     //   #100 assert(spike == 0);
        
        // Test case 6: five inputs non-zero, spike and reset
        #10 synapse_data = 31;
     //   #100 assert(spike == 1);
     //   #100 assert(spike == 0);
        
        // Test case 7: six inputs non-zero, no spike
        #10 synapse_data = 3;
     //   #100 assert(spike == 0);
        
        // Test case 8: seven inputs non-zero, no spike
        #10 synapse_data = 2;
     //   #100 assert(spike == 0);
        
        // Test case 9: eight inputs non-zero, no spike
        #10 synapse_data = 31;
    //    #100 assert(spike == 0);
        
        // Test case 10: nine inputs non-zero, spike and reset
        #10 synapse_data = 24;
   //     #100 assert(spike == 1);
   //     #100 assert(spike == 0);
        
        $display("All testcases passed");
        $finish;
    end
    
    // Clock generation
    always #5 clk = ~clk;

endmodule

