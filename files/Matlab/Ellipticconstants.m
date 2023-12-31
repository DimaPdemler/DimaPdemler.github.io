%This file is the elliptic integralcalculation but without the integral
%calculation (to save comp time)




m0=1.28; %magnetization magnet (tesla)
miu0=4*pi*10^(-7); %constant
delta1=1/1000; %thickness
R=12/1000;%average radius conductive cylinder
con=5.8*10^7; %conductivity copper conductor
b1=5/1000; %radius of the magnet
b2= 10/1000;
h=150/1000; %total length conductor cube
L=10/1000; %length of magnet
r=12*10^(-3);%also average radius of conductive cylinder?
const1= (m0)./(2.*pi);
const2=2*pi*delta1*con*R;
const3=2*pi*delta1*con*R;



FCoef= 59;
% FCoef= 11667;

% FCoef= 0;
