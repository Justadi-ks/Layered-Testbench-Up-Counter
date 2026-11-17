class scoreboard;

    mailbox mon2scb;
    logic [3:0] expected;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
        expected = 0;
    endfunction

    task run();
        logic [3:0] actual;

        forever begin
            mon2scb.get(actual);

            if (actual !== expected)
                $error("FAIL: Expected=%0d Actual=%0d",
                       expected, actual);
            else
                $display("PASS: Count=%0d", actual);

            expected = expected + 1;

        end
    endtask

endclass
