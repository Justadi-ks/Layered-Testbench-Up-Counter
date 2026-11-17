
class driver;

    virtual counter_if vif;
    mailbox gen2drv;

    function new(virtual counter_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;

        forever begin
            gen2drv.get(tr);

            @(negedge vif.clk);
            vif.rst = tr.rst;

        end
    endtask

endclass
