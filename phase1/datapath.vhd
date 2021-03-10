library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity datapath is
	port (	R0out, R1out, R2out, R3out,
				R4out, R5out, R6out, R7out,
				R8out, R9out, R10out, R11out,
				R12out, R13out, R14out, R15out,
				HIout, LOout, Zhighout, Zlowout,
				PCout, MDRout, InPortout, Cout,
				R0in, R1in, R2in, R3in,
				R4in, R5in, R6in, R7in,
				R8in, R9in, R10in, R11in,
				R12in, R13in, R14in, R15in,
				HIin, LOin, Zin, PCin, MDRin,
				Yin, MARin, IRin, Rd, clk, clr: 							in std_logic;
				Mdatain, BusMuxIn_Inport,
				C_sign_extended, IncPC:										in std_logic_vector(31 downto 0);
				sel:																in std_logic_vector(3 downto 0)
				);
end entity datapath;

architecture behavioural of datapath is

component encoder_32to5 is
port (	R0out, R1out, R2out, R3out,
			R4out, R5out, R6out, R7out,
			R8out, R9out, R10out, R11out,
			R12out, R13out, R14out, R15out,
			HIout, LOout, Zhighout, Zlowout,
			PCout, MDRout, InPortout, Cout: 							in std_logic;
			Z:																	out std_logic_vector(4 downto 0)
		);
end component encoder_32to5;

component reg is
	port(	clk			: in std_logic;
			clr			: in std_logic;
			writeEnable : in std_logic;
			D 				: in std_logic_vector(31 downto 0);
			Q				: out std_logic_vector(31 downto 0)
	);
end component reg;

component reg2 is
	port(	clk			: in std_logic;
			clr			: in std_logic;
			writeEnable : in std_logic;
			D 				: in std_logic_vector(63 downto 0);
			Q				: out std_logic_vector(63 downto 0)
	);
end component reg2;

component mdmux is
	port(	busmuxout, mdatain 	: in std_logic_vector(31 downto 0);
			rd							: in std_logic;
			mdmuxout					: out std_logic_vector(31 downto 0)
			
	);
end component mdmux;


component busmux is
port (	r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
			hi, lo, z_high, z_low, rpc, rmdr, inport, c_sign_extended:						in std_logic_vector(31 downto 0);
			Z:																								in std_logic_vector(4 downto 0);
			busmuxout:																					out std_logic_vector(31 downto 0)
		);
end component busmux;

component alu is
	port(	A, B	: in std_logic_vector(31 downto 0);
			sel		: in std_logic_vector(3 downto 0);
			C		: out std_logic_vector(63 downto 0)
	);
end component alu;

component split is
	port(	Z							: in std_logic_vector(63 downto 0);
			ZhighData, ZlowData  : out std_logic_vector(31 downto 0)
	);
end component split;

signal 	encoderOut																				:std_logic_vector(4 downto 0);

signal 	BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4,
			BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8,
			BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12,
			BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, 
			BusMuxIn_LO, BusMuxIn_Zhigh, BusMuxIn_Zlow, BusMuxIn_PC,
			BusMuxIn_MDR, BusMuxOut, MARData, IRData, A, B, ZhighData,
			ZlowData, MDMuxout 																				:std_logic_vector(31 downto 0);
			
signal	Z, C																							:std_logic_vector(63 downto 0);

begin

ENCODER: encoder_32to5 port map (R0out, R1out, R2out, R3out,
											R4out, R5out, R6out, R7out,
											R8out, R9out, R10out, R11out,
											R12out, R13out, R14out, R15out,
											HIout, LOout, Zhighout, Zlowout,
											PCout, MDRout, InPortout, Cout, 
											encoderOut);

BUS_MUX: busmux port map (	BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, 
									BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, 
									BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, 
									BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15,
									BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_Zhigh, BusMuxIn_Zlow, 
									BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_Inport, C_sign_extended,
									encoderOut,	BusMuxOut);

R_0: reg port map (clk, clr, R0in, BusMuxOut, BusMuxIn_R0);
R_1: reg port map (clk, clr, R1in, BusMuxOut, BusMuxIn_R1);
R_2: reg port map (clk, clr, R2in, BusMuxOut, BusMuxIn_R2);
R_3: reg port map (clk, clr, R3in, BusMuxOut, BusMuxIn_R3);
R_4: reg port map (clk, clr, R4in, BusMuxOut, BusMuxIn_R4);
R_5: reg port map (clk, clr, R5in, BusMuxOut, BusMuxIn_R5);
R_6: reg port map (clk, clr, R6in, BusMuxOut, BusMuxIn_R6);
R_7: reg port map (clk, clr, R7in, BusMuxOut, BusMuxIn_R7);
R_8: reg port map (clk, clr, R8in, BusMuxOut, BusMuxIn_R8);
R_9: reg port map (clk, clr, R9in, BusMuxOut, BusMuxIn_R9);
R_10: reg port map (clk, clr, R10in, BusMuxOut, BusMuxIn_R10);
R_11: reg port map (clk, clr, R11in, BusMuxOut, BusMuxIn_R11);
R_12: reg port map (clk, clr, R12in, BusMuxOut, BusMuxIn_R12);
R_13: reg port map (clk, clr, R13in, BusMuxOut, BusMuxIn_R13);
R_14: reg port map (clk, clr, R14in, BusMuxOut, BusMuxIn_R14);
R_15: reg port map (clk, clr, R15in, BusMuxOut, BusMuxIn_R15);
MAR: reg port map (clk, clr, MARin, BusMuxOut, MARData);
IR: reg port map (clk, clr, IRin, BusMuxOut, IRData);
PC: reg port map (clk, clr, PCin, IncPC, BusMuxIn_PC);
Y: reg port map (clk, clr, Yin, BusMuxOut, A);
HI: reg port map (clk, clr, HIin, BusMuxOut, BusMuxIn_HI);
LO: reg port map (clk, clr, LOin, BusMuxOut, BusMuxIn_LO);
ALUnit: alu port map(A, B, sel, C);
Zreg: reg2 port map (clk, clr, Zin, C, Z);
LOGIC: split port map (Z, ZhighData, ZlowData);
ZHIGH: reg port map (clk, clr, Zin, ZhighData, BusMuxIn_Zhigh);
ZLOW: reg port map (clk, clr, Zin, ZlowData, BusMuxIn_Zlow);
MDRMUX: mdmux port map (BusMuxOut, MDatain, Rd, MDmuxout);
MDR: reg port map (clk, clr, MDRin, MDmuxout, BusMuxIn_MDR);

end architecture behavioural;
