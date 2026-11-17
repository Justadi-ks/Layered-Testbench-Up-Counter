
class monitor;

    virtual counter_if vif;
    mailbox mon2scb;

    function new(virtual counter_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);
            #1;
            mon2scb.put(vif.count);
        end
    endtask

endclass
