// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Mon Mar 17 22:53:46 2025
// Host        : DESKTOP-88C58FM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom1_sim_netlist.v
// Design      : rom1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom1,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.1884 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "rom1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20032)
`pragma protect data_block
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
CToFwcQHAtCXPX6OWnwekBaToS7lTixayg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
