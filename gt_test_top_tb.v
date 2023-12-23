`timescale 1ns / 1ns
module gt_test_top_tb();

//*************************Parameter Declarations******************************

    parameter   TX_REFCLK_PERIOD   =   6.4;
    parameter   RX_REFCLK_PERIOD   =   6.4;
    parameter   SYSCLK_PERIOD      =   10.0;
    parameter   DCLK_PERIOD        =   10.0;
  
//************************Internal Register Declarations***********************

//************************** Register Declarations ****************************        

reg             tx_refclk_n_r;
reg             rx_refclk_n_r;
reg             drp_clk_r;
reg             sysclk_r;

//********************************Wire Declarations**********************************

    //--------------------------------- Global Signals ------------------------------
wire            tx_refclk_p_r;
wire            rx_refclk_p_r; 
    
    //-------------------------- Example Module Connections -------------------------

wire            rxn_in_i;
wire            rxp_in_i;
wire            txn_out_i;
wire            txp_out_i;

//*********************************Main Body of Code**********************************



    // ------------------------- GT Serial Connections ------------------------
    assign   rxn_in_i           =  txn_out_i;
    assign   rxp_in_i           =  txp_out_i;  
    //------------------------------ Global Signals ----------------------------
    


    //---------- Generate Reference Clock input to UPPER GTCLK ----------------
    
    initial begin
        tx_refclk_n_r = 1'b1;
    end

    always  
        #(TX_REFCLK_PERIOD/2) tx_refclk_n_r = !tx_refclk_n_r;

    assign tx_refclk_p_r = !tx_refclk_n_r;

    initial begin
        rx_refclk_n_r = 1'b1;
    end

    always  
        #(RX_REFCLK_PERIOD/2) rx_refclk_n_r = !rx_refclk_n_r;

    assign rx_refclk_p_r = !rx_refclk_n_r;
                 
    //------------------------ Generate DRP Clock ----------------------------
    
    initial begin
        drp_clk_r = 1'b1;
    end

    always  
        #(DCLK_PERIOD/2) drp_clk_r = !drp_clk_r;
      
    //------------------------ Generate System Clock ----------------------------
    initial begin
        sysclk_r = 1'b1;
    end

    always  
        #(SYSCLK_PERIOD/2) sysclk_r = !sysclk_r;
    
 
    initial
    begin
        #347000;
        $stop;
    end


 

    //----------------- Instantiate an gtwizard_1_exdes module  -----------------


gt_test_top gt_test_top_u(
            .ref_clk_n       (tx_refclk_n_r),
            .ref_clk_p       (tx_refclk_p_r),
            .sysclk          (drp_clk_r),
            .GT_RXN          (rxn_in_i),
            .GT_RXP          (rxp_in_i),
            .GT_TXN          (txn_out_i),
            .GT_TXP          (txp_out_i)

);    


endmodule
