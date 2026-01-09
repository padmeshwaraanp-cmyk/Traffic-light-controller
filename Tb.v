module tb;

    reg clk = 0;
    reg rst = 1;
    reg [15:0] vehicle_count;

    wire [2:0] lights;
    wire [7:0] green_time, yellow_time, red_time;

    integer fd;
    integer value;
    integer status;

    top dut (
        .clk(clk),
        .rst(rst),
        .vehicle_count(vehicle_count),
        .lights(lights),
        .green_time(green_time),
        .yellow_time(yellow_time),
        .red_time(red_time)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Read Python output
        fd = $fopen("count", "r");
        if (fd == 0) begin
            $display("ERROR: vehicle_count.txt not found");
            $finish;
        end

        status = $fscanf(fd, "%d", value);
        $fclose(fd);

        vehicle_count = value;

        // Release reset AFTER count is applied
        #20 rst = 0;

        // Wait FSM to compute
        #20;

        $display("\n===== SMART TRAFFIC FSM =====");
        $display("Vehicle Count = %0d", vehicle_count);
        $display("GREEN  = %0d", green_time);
        $display("YELLOW = %0d", yellow_time);
        $display("RED    = %0d", red_time);

        #100 $finish;
    end

endmodule
