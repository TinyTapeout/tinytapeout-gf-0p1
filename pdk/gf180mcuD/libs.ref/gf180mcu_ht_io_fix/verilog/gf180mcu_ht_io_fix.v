// Based on the GlobalFoundries PDK
// Original (c) 2022 GlobalFoundries PDK Authors
// License: Apache 2.0

module gf180mcu_ht_io_fix__dvdd (DVDD, DVSS, VSS);
	inout	DVDD;
	inout	DVSS;
	inout	VSS;
	supply1	DVDD;
endmodule

module gf180mcu_ht_io_fix__dvss (DVDD, DVSS, VDD);
	inout	DVDD;
	inout	DVSS;
	inout	VDD;
	supply0	DVSS;
endmodule

