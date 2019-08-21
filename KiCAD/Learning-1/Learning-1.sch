EESchema Schematic File Version 4
LIBS:Learning-1-cache
EELAYER 29 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 5CFD853E
P 2250 1800
F 0 "R?" V 2043 1800 50  0000 C CNN
F 1 "1 k" V 2134 1800 50  0000 C CNN
F 2 "" V 2180 1800 50  0001 C CNN
F 3 "~" H 2250 1800 50  0001 C CNN
	1    2250 1800
	0    1    1    0   
$EndComp
$Comp
L MCU_Microchip_PIC12:PIC12C508A-ISN U?
U 1 1 5CFD8A38
P 3500 1800
F 0 "U?" H 3500 2581 50  0000 C CNN
F 1 "PIC12C508A-ISN" H 3500 2490 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4100 2450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/40139e.pdf" H 3500 1800 50  0001 C CNN
	1    3500 1800
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F3:STM32F303CBTx U?
U 1 1 5CFD8F7E
P 5650 2300
F 0 "U?" H 5600 711 50  0000 C CNN
F 1 "STM32F303CBTx" H 5600 620 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5050 900 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00058181.pdf" H 5650 2300 50  0001 C CNN
	1    5650 2300
	1    0    0    -1  
$EndComp
$Comp
L FPGA_Lattice:ICE40HX8K-BG121 U?
U 1 1 5CFDA6EF
P 8200 2200
F 0 "U?" H 8580 2203 50  0000 L CNN
F 1 "ICE40HX8K-BG121" H 8580 2112 50  0000 L CNN
F 2 "Package_BGA:BGA-121_9.0x9.0mm_Layout11x11_P0.8mm_Ball0.4mm_Pad0.35mm_NSMD" H 8200 750 50  0001 C CNN
F 3 "http://www.latticesemi.com/Products/FPGAandCPLD/iCE40" H 7350 3200 50  0001 C CNN
	1    8200 2200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
