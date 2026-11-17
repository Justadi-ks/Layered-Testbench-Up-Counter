module tb;

    bit clk = 0;

    always #5 clk = ~clk;

    counter_if intf(clk);

    up_counter dut (
        .clk   (clk),
        .rst   (intf.rst),
        .count (intf.count)
    );

    environment env;

    initial begin

        intf.rst = 1;

        env = new(intf);

        // Apply initial reset
        repeat (2) @(posedge clk);

        env.run();

    end

    initial begin
        #2500;
        $finish;
    end

endmodule
