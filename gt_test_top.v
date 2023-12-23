module gt_test_top(
ref_clk_n,
ref_clk_p,
sysclk,
GT_RXN,
GT_RXP,
GT_TXN,
GT_TXP

);    
input ref_clk_n;
input ref_clk_p;
input sysclk;
input GT_RXN;
input GT_RXP;
output GT_TXN;
output GT_TXP;



wire  tx_usr_clk,rx_usr_clk;
wire  tx_rst_n,rx_rst_n;
reg   [31:0] tx_data;
wire   [31:0] rx_data;
reg   [3:0]  tx_char;
wire   [3:0]  rx_char;
reg   [31:0]  cnt;
//产生数据
assign gt_reset_n = tx_rst_n && rx_rst_n;
always@(posedge tx_usr_clk or posedge gt_reset_n) begin
    if(!gt_reset_n)                 cnt <= 'd0;
    else if(cnt == 32'd100200)           cnt <= 'd0;
    else                            cnt <= cnt + 1'b1;
end
always@(posedge tx_usr_clk or posedge gt_reset_n) begin
    if(!gt_reset_n)              tx_data <= 'd0;
    else if(cnt==199)            tx_data <= 32'h000000bc;
    else if (cnt <= 32'd100200)  tx_data  <= cnt -200; //tx_data <= {8'd1,8'd2,8'd3,8'd4};
    else                         tx_data <= 'd0;
end
always@(posedge tx_usr_clk or posedge gt_reset_n) begin
    if(!gt_reset_n)              tx_char <= 'd0;
    else if(cnt==199)            tx_char <= 4'b0001;
    else                         tx_char <= 'd0;
end

//接收数据
reg [3:0]   rx_char_r;
reg [31:0]  rx_data_r;

always@(posedge rx_usr_clk or posedge gt_reset_n) begin
    if(!gt_reset_n)              rx_char_r<= 'd0;
    else begin
        rx_char_r  <=  rx_char;         
    end
end
always@(posedge rx_usr_clk or posedge gt_reset_n) begin
    if(!gt_reset_n)             rx_data_r<='d0;          
    else begin
        rx_data_r  <=  rx_data;  
    end
end

gt_init gt_init_u(
        .q0_clk1_gtrefclk_pad_n_in   (ref_clk_n),
        .q0_clk1_gtrefclk_pad_p_in   (ref_clk_p),
        .sysclk_in                   (sysclk),
        .gt0_txusrclk2_out           (tx_usr_clk),
        .gt0_rxusrclk2_out           (rx_usr_clk),
        .gt0_tx_fsm_reset_done_out   (tx_rst_n),
        .gt0_rxresetdone_out         (rx_rst_n),
        .gt0_rxdata_out              (rx_data),
        .gt0_rxcharisk_out           (rx_char),
        .gt0_txdata_in               (tx_data),
        .gt0_txcharisk_in            (tx_char),
        .gt0_gtxrxp_in               (GT_RXP),
        .gt0_gtxrxn_in               (GT_RXN),
        .gt0_gtxtxn_out              (GT_TXN),
        .gt0_gtxtxp_out              (GT_TXP)
    );

endmodule
