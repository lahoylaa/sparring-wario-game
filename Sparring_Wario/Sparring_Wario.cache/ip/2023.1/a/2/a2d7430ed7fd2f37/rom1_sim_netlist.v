// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Mon Mar 17 23:10:22 2025
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
  (* C_INIT_FILE_NAME = "rom1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
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
v6YGE6He3QEig6xsF+csYSCdZ+5op/YIKA==
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
