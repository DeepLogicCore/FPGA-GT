module gt_init(
q0_clk1_gtrefclk_pad_n_in   ,
q0_clk1_gtrefclk_pad_p_in   ,
sysclk_in                   ,
gt0_txusrclk2_out           ,
gt0_rxusrclk2_out           ,
gt0_tx_fsm_reset_done_out   ,
gt0_rxresetdone_out         ,
gt0_rxdata_out              ,
gt0_rxcharisk_out           ,
gt0_txdata_in               ,
gt0_txcharisk_in            ,
gt0_gtxrxp_in               ,
gt0_gtxrxn_in               ,
gt0_gtxtxn_out              ,
gt0_gtxtxp_out              
    );

//时钟
input    q0_clk1_gtrefclk_pad_n_in;   //输入的差分参考时钟
input    q0_clk1_gtrefclk_pad_p_in;
input    sysclk_in;                   //系统时钟（DPR时钟）
output   gt0_txusrclk2_out,gt0_rxusrclk2_out; //GT输出给用户的时钟信号
//复位
output   gt0_tx_fsm_reset_done_out;   //TX复位完成标准，高有效
output   gt0_rxresetdone_out ;        //RX复位完成标准，高有效
//输入输出信号
output [31:0] gt0_rxdata_out;
output [3:0]  gt0_rxcharisk_out;
input  [31:0] gt0_txdata_in;
input  [3:0]  gt0_txcharisk_in;
input  gt0_gtxrxp_in,gt0_gtxrxn_in;
output gt0_gtxtxn_out,gt0_gtxtxp_out;


    gtwizard_1  gtwizard_1_i
    (
     .soft_reset_tx_in(0), // input wire soft_reset_tx_in
     .soft_reset_rx_in(0), // input wire soft_reset_rx_in
     .dont_reset_on_data_error_in(0), // input wire dont_reset_on_data_error_in
    .q0_clk1_gtrefclk_pad_n_in(q0_clk1_gtrefclk_pad_n_in), // input wire q0_clk1_gtrefclk_pad_n_in
    .q0_clk1_gtrefclk_pad_p_in(q0_clk1_gtrefclk_pad_p_in), // input wire q0_clk1_gtrefclk_pad_p_in
     .gt0_tx_fsm_reset_done_out(gt0_tx_fsm_reset_done_out), // output wire gt0_tx_fsm_reset_done_out
     .gt0_rx_fsm_reset_done_out(), // output wire gt0_rx_fsm_reset_done_out
     .gt0_data_valid_in(0), // input wire gt0_data_valid_in
 
    .gt0_txusrclk_out(), // output wire gt0_txusrclk_out
    .gt0_txusrclk2_out(gt0_txusrclk2_out), // output wire gt0_txusrclk2_out
    .gt0_rxusrclk_out(), // output wire gt0_rxusrclk_out
    .gt0_rxusrclk2_out(gt0_rxusrclk2_out), // output wire gt0_rxusrclk2_out
    //_________________________________________________________________________
    //GT0  (X0Y0)
    //____________________________CHANNEL PORTS________________________________
    //------------------------------- CPLL Ports -------------------------------
        .gt0_cpllfbclklost_out          (), // output wire gt0_cpllfbclklost_out
        .gt0_cplllock_out               (), // output wire gt0_cplllock_out
        .gt0_cpllreset_in               (0), // input wire gt0_cpllreset_in
    //-------------------------- Channel - DRP Ports  --------------------------
        .gt0_drpaddr_in                 (0), // input wire [8:0] gt0_drpaddr_in
        .gt0_drpdi_in                   (0), // input wire [15:0] gt0_drpdi_in
        .gt0_drpdo_out                  (), // output wire [15:0] gt0_drpdo_out
        .gt0_drpen_in                   (0), // input wire gt0_drpen_in
        .gt0_drprdy_out                 (), // output wire gt0_drprdy_out
        .gt0_drpwe_in                   (0), // input wire gt0_drpwe_in
    //------------------------- Digital Monitor Ports --------------------------
        .gt0_dmonitorout_out            (), // output wire [7:0] gt0_dmonitorout_out
    //----------------------------- Loopback Ports -----------------------------
        .gt0_loopback_in                (0), // input wire [2:0] gt0_loopback_in
    //---------------------------- Power-Down Ports ----------------------------
        .gt0_rxpd_in                    (0), // input wire [1:0] gt0_rxpd_in
        .gt0_txpd_in                    (0), // input wire [1:0] gt0_txpd_in
    //------------------- RX Initialization and Reset Ports --------------------
        .gt0_eyescanreset_in            (0), // input wire gt0_eyescanreset_in
        .gt0_rxuserrdy_in               (1), // input wire gt0_rxuserrdy_in
    //------------------------ RX Margin Analysis Ports ------------------------
        .gt0_eyescandataerror_out       (), // output wire gt0_eyescandataerror_out
        .gt0_eyescantrigger_in          (0), // input wire gt0_eyescantrigger_in
    //----------------------- Receive Ports - CDR Ports ------------------------
        .gt0_rxcdrhold_in               (0), // input wire gt0_rxcdrhold_in
        .gt0_rxcdrovrden_in             (0), // input wire gt0_rxcdrovrden_in
    //----------------- Receive Ports - Clock Correction Ports -----------------
        .gt0_rxclkcorcnt_out            (), // output wire [1:0] gt0_rxclkcorcnt_out
    //---------------- Receive Ports - FPGA RX interface Ports -----------------
        .gt0_rxdata_out                 (gt0_rxdata_out), // output wire [31:0] gt0_rxdata_out
    //----------------- Receive Ports - Pattern Checker Ports ------------------
        .gt0_rxprbserr_out              (), // output wire gt0_rxprbserr_out
        .gt0_rxprbssel_in               (0), // input wire [2:0] gt0_rxprbssel_in
    //----------------- Receive Ports - Pattern Checker ports ------------------
        .gt0_rxprbscntreset_in          (0), // input wire gt0_rxprbscntreset_in
    //---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
        .gt0_rxdisperr_out              (), // output wire [3:0] gt0_rxdisperr_out
        .gt0_rxnotintable_out           (), // output wire [3:0] gt0_rxnotintable_out
    //------------------------- Receive Ports - RX AFE -------------------------
        .gt0_gtxrxp_in                  (gt0_gtxrxp_in), // input wire gt0_gtxrxp_in
    //---------------------- Receive Ports - RX AFE Ports ----------------------
        .gt0_gtxrxn_in                  (gt0_gtxrxn_in), // input wire gt0_gtxrxn_in
    //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
        .gt0_rxbufreset_in              (0), // input wire gt0_rxbufreset_in
        .gt0_rxbufstatus_out            (), // output wire [2:0] gt0_rxbufstatus_out
    //------------ Receive Ports - RX Byte and Word Alignment Ports ------------
        .gt0_rxbyteisaligned_out        (), // output wire gt0_rxbyteisaligned_out
        .gt0_rxbyterealign_out          (), // output wire gt0_rxbyterealign_out
        .gt0_rxcommadet_out             (), // output wire gt0_rxcommadet_out
        .gt0_rxmcommaalignen_in         (1), // input wire gt0_rxmcommaalignen_in
        .gt0_rxpcommaalignen_in         (1), // input wire gt0_rxpcommaalignen_in
    //------------------- Receive Ports - RX Equalizer Ports -------------------
        .gt0_rxdfelpmreset_in           (0), // input wire gt0_rxdfelpmreset_in
        .gt0_rxmonitorout_out           (), // output wire [6:0] gt0_rxmonitorout_out
        .gt0_rxmonitorsel_in            (0), // input wire [1:0] gt0_rxmonitorsel_in
    //------------- Receive Ports - RX Fabric Output Control Ports -------------
        .gt0_rxoutclkfabric_out         (), // output wire gt0_rxoutclkfabric_out
    //----------- Receive Ports - RX Initialization and Reset Ports ------------
        .gt0_gtrxreset_in               (0), // input wire gt0_gtrxreset_in
        .gt0_rxpcsreset_in              (0), // input wire gt0_rxpcsreset_in
        .gt0_rxpmareset_in              (0), // input wire gt0_rxpmareset_in
    //---------------- Receive Ports - RX Margin Analysis ports ----------------
        .gt0_rxlpmen_in                 (1), // input wire gt0_rxlpmen_in
    //--------------- Receive Ports - RX Polarity Control Ports ----------------
        .gt0_rxpolarity_in              (0), // input wire gt0_rxpolarity_in
    //----------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        .gt0_rxchariscomma_out          (), // output wire [3:0] gt0_rxchariscomma_out
        .gt0_rxcharisk_out              (gt0_rxcharisk_out), // output wire [3:0] gt0_rxcharisk_out
    //------------ Receive Ports -RX Initialization and Reset Ports ------------
        .gt0_rxresetdone_out            (gt0_rxresetdone_out), // output wire gt0_rxresetdone_out
    //---------------------- TX Configurable Driver Ports ----------------------
        .gt0_txpostcursor_in            (0), // input wire [4:0] gt0_txpostcursor_in
        .gt0_txprecursor_in             (0), // input wire [4:0] gt0_txprecursor_in
    //------------------- TX Initialization and Reset Ports --------------------
        .gt0_gttxreset_in               (0), // input wire gt0_gttxreset_in
        .gt0_txuserrdy_in               (1), // input wire gt0_txuserrdy_in
    //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        .gt0_txchardispmode_in          (0), // input wire [3:0] gt0_txchardispmode_in
        .gt0_txchardispval_in           (0), // input wire [3:0] gt0_txchardispval_in
    //---------------- Transmit Ports - Pattern Generator Ports ----------------
        .gt0_txprbsforceerr_in          (0), // input wire gt0_txprbsforceerr_in
    //-------------------- Transmit Ports - TX Buffer Ports --------------------
        .gt0_txbufstatus_out            (), // output wire [1:0] gt0_txbufstatus_out
    //------------- Transmit Ports - TX Configurable Driver Ports --------------
        .gt0_txdiffctrl_in              (0), // input wire [3:0] gt0_txdiffctrl_in
        .gt0_txmaincursor_in            (0), // input wire [6:0] gt0_txmaincursor_in
    //---------------- Transmit Ports - TX Data Path interface -----------------
        .gt0_txdata_in                  (gt0_txdata_in), // input wire [31:0] gt0_txdata_in
    //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .gt0_gtxtxn_out                 (gt0_gtxtxn_out), // output wire gt0_gtxtxn_out
        .gt0_gtxtxp_out                 (gt0_gtxtxp_out), // output wire gt0_gtxtxp_out
    //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        .gt0_txoutclkfabric_out         (), // output wire gt0_txoutclkfabric_out
        .gt0_txoutclkpcs_out            (), // output wire gt0_txoutclkpcs_out
    //------------------- Transmit Ports - TX Gearbox Ports --------------------
        .gt0_txcharisk_in               (gt0_txcharisk_in), // input wire [3:0] gt0_txcharisk_in
    //----------- Transmit Ports - TX Initialization and Reset Ports -----------
        .gt0_txpcsreset_in              (0), // input wire gt0_txpcsreset_in
        .gt0_txpmareset_in              (0), // input wire gt0_txpmareset_in
        .gt0_txresetdone_out            (), // output wire gt0_txresetdone_out
    //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .gt0_txpolarity_in              (0), // input wire gt0_txpolarity_in
    //---------------- Transmit Ports - pattern Generator Ports ----------------
        .gt0_txprbssel_in               (0), // input wire [2:0] gt0_txprbssel_in

    //____________________________COMMON PORTS________________________________
    .gt0_qplloutclk_out(), // output wire gt0_qplloutclk_out 
    .gt0_qplloutrefclk_out(), // output wire gt0_qplloutrefclk_out
     .sysclk_in(sysclk_in) // input wire sysclk_in

);
endmodule
