`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2023 12:56:07 AM
// Design Name: 
// Module Name: tb_if_neuron
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

module if_neuron_tb;

  reg clk;
  reg reset;
  reg spike;
  wire fire;
  
  if_neuron neuron (
    .clk(clk),
    .reset(reset),
 //   .threshold(5),
    .spike(spike),
    .fire(fire)
  );
  
  integer test_count;
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    spike = 0;
    test_count = 0;
    
    // Wait for 2 clock cycles
    #2 reset = 0;
    
    // Test 1: No input spike, should not fire
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    // Test 2: 1 input spike, should not fire
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    // Test 3: 2 input spikes, should not fire
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    // Test 4: 5 input spikes, should fire
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 1) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 1, but was %b", test_count, fire);
    end
    
    // Test 5: No input spike after firing, should not fire
    spike = 0;
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    // Test 6: 3 input spikes after firing, should not fire
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    // Test 7: 5 input spikes after firing, should fire
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 1) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 1, but was %b", test_count, fire);
    end
    
    // Test 8: No input spike after firing 2nd time, should not fire
    spike = 0;
    #10;
    test_count = test_count + 1;
    if (fire === 0) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 0, but was %b", test_count, fire);
    end
    
    
    // Test 9: 4 input spikes after firing, should fire
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire == 1 ) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 1, but was %b", test_count, fire);
    end
    
    // Test 10: 6 consecutive non-zero inputs, should fire after the 5th input
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    spike = 1;
    #10;
    test_count = test_count + 1;
    if (fire === 1) begin
      $display("Test %0d PASSED", test_count);
    end else begin
      $display("Test %0d FAILED: Expected fire to be 1, but was %b", test_count, fire);
    end

    
    $finish;

    end
    
    // Generate clock
    always #5 clk = ~clk;
    
    endmodule


