// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Mon Mar 17 23:10:22 2025
// Host        : DESKTOP-88C58FM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top rom1 -prefix
//               rom1_ rom1_sim_netlist.v
// Design      : rom1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom1,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module rom1
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
  rom1_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19616)
`pragma protect data_block
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
yFMtkZytQk0=
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
