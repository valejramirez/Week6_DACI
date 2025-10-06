LEVEL   = 1;
VTOn    = 0.7;           %(V)        -> Tensión umbral
VTOp    = 0.8;           %(V)        -> Tensión umbral
GAMMA   = 0.45;          %(V^1/2)    -> Coeficiente de cuerpo
PHI     = 0.9;           %(V)        -> Potencial ? (? 2F)
NSUB    = 9e14;          %(cm^-3)    -> Dopaje del sustrato
LD      = 0.08;          %(um)        -> Longitud de difusión (fuente/drenaje)
UON     = 0.0350;        %(m^2/V·s) -> Movilidad de portadores
UOP     = 0.0100;        %(m^2/V·s) -> Movilidad de portadores
LAMBDAn  = 0.1;          %(V^-1)     -> Modulación de longitud de canal
LAMBDAp  = 0.2;          %(V^-1)     -> Modulación de longitud de canal
TOX     = 9e-9;          %(m)        -> Espesor del óxido
PB      = 0.9;           %(V)        -> Potencial de unión
CJ      = 0.56e-3;       %(F/m^2)    -> Capacitancia de unión por área
CJSW    = 0.35e-11;      %(F/m)      -> Capacitancia de unión lateral
MJ      = 0.45;          %(unitless) -> Exponente de CJ
MJSW    = 0.2;           %(unitless) -> Exponente de CJSW
CGDO    = 0.4e-9;        %(F/m)      -> Capacitancia solapamiento puerta-drenaje 
JS      = 1.0e-8;        %(A/m^2)    -> Corriente de fuga por unidad de área
Vdd     = 3;             %V
W       = 50;            %(um)
L       = 0.5;           %(um)
E = 1e-6       ;          %m 
Cox     = 3836e-6;       %F/m^2
Id      = 1e-3;             %A
Idm     = 1;              %ma
W1      =50e-6   ;        %m
L1      = 0.5e-6;         %m
Rs = 1000;
Rd = 2000;
%Av= -gm*Rd
%Question 1 
Leff = L - 2*LD;
%Question 2 
a = 0.5*UON*1000*Cox*(W/Leff);
%Question 3
Vds = 3 - 2 - 0;
Vgs1=sqrt(2*Id/(UON*Cox*W/Leff*(1+LAMBDAn*Vds)))+VTOn;
Vov = Vgs1 - VTOn;
%Question 4


gmeff = sqrt(2*Idm*UON*Cox*(W/Leff)*1000*(1+Vds*LAMBDAn));
gmaeff = gmeff/1000;
%Question 5
b = 2* W1 * Leff*1e-6 * Cox/3;  %en Faradios
bf = b*1e15; %en fentaFaradios
%Question 6
CGDOf = CGDO * 1e15;
Coverlap= 2*CGDO*1e15 *W1 % pasamos a fentafaradios y multiplicamos por metros
%Question 7
Cgs_prima = (2*W1*Leff*1e-6*Cox/3);
Cgs_primaf= Cgs_prima *1e15;
Cgs = Cgs_primaf + W1*CGDOf*2 %lleva Cgdof*2 porque es Coverlap
Cgsa = Cgs * 1e-15;
%Question 8
Cgd = W1*CGDOf
Cgda = Cgd * 1e-15;
%Question 9 
CdbFaradios = W1*E*CJ + (2*(W1+E)*CJSW);
Cdb= CdbFaradios*1e15
% %Question 10
wzero= gmaeff/ Cgda;
wz= wzero/(2*pi*1e9)

%Question 11
wineff = 1 /(Rs*(Cgsa + (1+gmaeff*Rd)*Cgda));

 winaeff = wineff/ (2*pi*1e9)
%Question 12
 wout = 1 / (Rd* (CdbFaradios + Cgda));
 wouta = wout / (2*pi*1e9)
%Question 13
Leff = L - 2*LD;
Leffm= Leff * 1e-6
%Question 14
Vgs2= sqrt(2*Id/(UON*Cox*W/Leff))+VTOn;
Vov = Vgs2 - VTOn
%Question 15
gm2eff = sqrt(2*UON*Cox*1000*(W1/Leffm)*Idm)
%Question 16
CGDOf2 = CGDO * 1e15;
Coverlap2= (CGDOf2*2)*1e15 *W1 % pasamos a fentafaradios y multiplicamos por metros
%Question 17
Cgs_prima2 = (2*W1*Leff*1e-6*Cox/3);
Cgs_primaf2 = Cgs_prima *1e15;
Cgs2 = Cgs_primaf + W1*CGDOf*2
Cgsa2 = Cgs * 1e-15;
%Question 18 
gm2aeff= gm2eff/1000;
L_gmeff = (Cgsa/ gm2aeff)*(10000 - (1/gm2eff));
Ln2= L_gmeff * 1e9

