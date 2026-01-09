module traffic_fsm (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] vehicle_count,

    output reg  [2:0]  lights,
    output reg  [7:0]  green_time,
    output reg  [7:0]  yellow_time,
    output reg  [7:0]  red_time
);

    localparam GREEN  = 3'b001;
    localparam YELLOW = 3'b010;
    localparam RED    = 3'b100;

    reg [2:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state       <= GREEN;
            lights      <= GREEN;

            green_time  <= 8'd10;
            yellow_time <= 8'd4;
            red_time    <= 8'd20;
        end else begin
            // Calculate timings ONCE per cycle
            if (vehicle_count <= 8)
                green_time <= 8'd20;
            else if (vehicle_count <= 30)
                green_time <= 8'd30;
            else if (vehicle_count <= 60)
                green_time <= 8'd40;
            else
                green_time <= 8'd60;

            yellow_time <= 8'd4;
            red_time    <= 8'd20;

            // Simple state rotation
            case (state)
                GREEN:  begin state <= YELLOW; lights <= YELLOW; end
                YELLOW: begin state <= RED;    lights <= RED;    end
                RED:    begin state <= GREEN;  lights <= GREEN;  end
            endcase
        end
    end

endmodule
