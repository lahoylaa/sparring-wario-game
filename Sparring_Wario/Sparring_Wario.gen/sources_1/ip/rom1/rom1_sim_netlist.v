// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Mon Mar 17 23:10:23 2025
// Host        : DESKTOP-88C58FM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Projects/FPGA/Sparring_Wario/Sparring_Wario.gen/sources_1/ip/rom1/rom1_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19904)
`pragma protect data_block
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
PH1JBtwhIwY8Hpw=
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
