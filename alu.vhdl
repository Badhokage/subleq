------------------------------------------------------------
-- ALU for subleq computer	
--
------------------------------------------------------------

library ieee;				-- component #1
use ieee.std_logic_1164.all;

entity XOR_GATE_2 is
port(  	A:	in std_logic;
		B:	in std_logic;
		F:	out std_logic
);
end XOR_GATE_2;

architecture behv of XOR_GATE_2 is
begin
process(A,B)
begin
	F <= A xor B 	-- behavior des.
end process;
end behv;

-------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity AND_GATE_2 is
port(	A: in std_logic;
		B: in std_logic;
		F: out std_logic
);
end AND_GATE_2;

architecture behv of AND_GATE_2 is
begin
process(A,B)
begin
	F <= A and B;			-- behaviour description
end process;
end behv;

--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity OR_GATE_2 is
port(	A: in std_logic;
		B: in std_logic;
		F: out std_logic
);
end OR_GATE_2;

architecture behv of OR_GATE_2 is
begin
process(A,B)
begin
	F <= A or B;			-- behaviour description
end process;
end behv;

--------------------------------------------------------------

library ieee;				-- top level circuit
use ieee.std_logic_1164.all;
use work.all;

entity comb_ckt is

port(	a3: in std_logic;
		a2: in std_logic;
		a1: in std_logic;
		a0: in std_logic;
		b3: in std_logic;
		b2: in std_logic;
		b1: in std_logic;
		b0: in std_logic;

		aeqb: out std_logic;
		agtb: out std_logic;
		altb: out std_logic
);
end comb_ckt;

architecture struct of comb_ckt is

    signal wire1: std_logic;		-- signal just like wire
    signal wire2: std_logic;		-- signal just like wire
    signal wire3: std_logic;		-- signal just like wire
    signal wire4: std_logic;		-- signal just like wire
    signal wire5: std_logic;		-- signal just like wire
    signal wire6: std_logic;		-- signal just like wire
    signal wire7: std_logic;		-- signal just like wire
    signal wire8: std_logic;		-- signal just like wire
    signal wire9: std_logic;		-- signal just like wire
    signal wire10: std_logic;		-- signal just like wire
    signal wire11: std_logic;		-- signal just like wire
    signal wire12: std_logic;		-- signal just like wire
    signal wire13: std_logic;		-- signal just like wire
    signal wire14: std_logic;		-- signal just like wire
    signal wire15: std_logic;		-- signal just like wire
    

begin

    Gate1: entity work.XNOR_GATE_2(behv) port map (a3, b3, wire1);
    Gate2: entity work.XNOR_GATE_2(behv) port map (a2, b2, wire2);
    Gate3: entity work.XNOR_GATE_2(behv) port map (a1, b1, wire3);
    Gate4: entity work.XNOR_GATE_2(behv) port map (a0, b0, wire4);
    
    Gate5: entity work.AND_GATE_4(behv) port map (wire1, wire2, wire3, wire4, wire14);
    
    Gate6: entity work.NOT_GATE(behv) port map (b3,wire10);
    Gate7: entity work.NOT_GATE(behv) port map (b2,wire11);
    Gate8: entity work.NOT_GATE(behv) port map (b1,wire12);
    Gate9: entity work.NOT_GATE(behv) port map (b0,wire13);
    
    Gate10: entity work.AND_GATE_2(behv) port map (a3,wire10,wire5);
    Gate11: entity work.AND_GATE_3(behv) port map (a2,wire11,wire1,wire6);
    Gate12: entity work.AND_GATE_4(behv) port map (a1,wire12,wire1,wire2,wire7);
    Gate13: entity work.AND_GATE_5(behv) port map (a0,wire13,wire1,wire2,wire3,wire8);
    Gate14:	entity work.OR_GATE_4(behv) port map (wire5, wire6, wire7, wire8, wire15);
    aeqb <= wire14;
    agtb <= wire15;
    Gate15: entity work.NOR_GATE_2(behv) port map(wire14,wire15,altb);
    
end struct;

----------------------------------------------------------------
