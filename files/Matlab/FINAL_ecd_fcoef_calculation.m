clear
m0=1.28; %magnetization magnet (tesla)
delta1=1/1000; %thickness
con=5.8*10^7; %conductivity copper conductor
b1=2/1000; %inner radius of the magnet
b2= 6/1000; %outer radius of the magnet
h=6/1000; %height of one magnet ring plus thin iron top 
nM=11; %number of these magnet rings in the ECD
% htot=nM*h; %full length of magnet system
L=100/1000; %height of conductive cylinder
r=6.5*10^(-3);%average radius of conductive cylinder
const1= (m0)./(2.*pi);
const2=2*pi*delta1*con*r;

syms z z1

k1= @(z1,z) (4.*b1.*r)./(((b1+r).^2)+(z-z1).^2);
k2= @(z1,z) (4.*b2.*r)./(((b2+r).^2)+(z-z1).^2);

E1=@(z1,z) (ellipticK(k1(z1,z)));
E2=@(z1,z) (ellipticE(k1(z1,z)));
E3=@(z1,z) (ellipticK(k2(z1,z)));
E4=@(z1,z) (ellipticE(k2(z1,z)));

%This is the integrand split into two parts and then multiplied together
cross1= @(z1,z) (z-z1)./(r.*(((b1+r).^2+(z-z1).^2)).^(1./2));
cross2= @(z1,z) (-1).*E1(z1,z)+((((b1+r).^2+(z-z1).^2)./((b1-r).^2+(z-z1).^2)).*E2(z1,z));
crossf1= @(z1,z) (cross1(z1,z).*cross2(z1,z));

%This is the second inegrand...
cross3= @(z1,z) (z-z1)./(r.*(((b2+r).^2+(z-z1).^2)).^(1./2));
cross4= @(z1,z) (-1).*E3(z1,z)+((((b2+r).^2+(z-z1).^2)./((b2-r).^2+(z-z1).^2)).*E4(z1,z));
crossf2= @(z1,z) (cross3(z1,z).*cross4(z1,z));

%Subtracts the outer diameter from the inner diameter to make the ring
crossf3 = @(z1,z) crossf2(z1,z)-crossf1(z1,z);

%The integral calculation iteself
erm3=integral(@(z) (integral(@(z1)(crossf3(z1,z)),-h/2,h/2,'ArrayValued',true).^2), -L/2,L/2,'ArrayValued',false);
%mutlipying by the constants now
FCoef1=erm3.*const1.^2.*const2;

%Calculting the realistic friction coefficient of system
FCoeftot=FCoef1*nM;
FCoefreal=FCoeftot*(59/(10.17*10));

FCoefreal2=FCoeftot*(59/(10.17*10))*172;
fprintf(['The FCoef of one ring is: ', num2str(FCoef1),'\n The FCoef of the system is: ', num2str(FCoefreal),'\n The FCoef of the system in 4K is: ', num2str(FCoefreal2), '\n'])
