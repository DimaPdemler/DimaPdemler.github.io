
%author: Dmitri Demler

%Finds the optimal length of eddy current damper that makes for the biggest
%amplitude attenuation. Calculations are also in the calculations pdf file.
%

clear
FINAL_ecd_fcoef_calculation;
SpringConstantCalculator;

m0=1.33; %magnetization magnet (tesla)
delta1=1/1000; %thickness
R=13.5/1000;%average radius conductive cylinder
con=5.8*10^7*172; %conductivity copper conductor
b1=4/1000; %inner radius of the magnet
b2= 12/1000; %outer radius of the magnet
h=7/1000; %height of one magnet ring plus thin iron top 
nM=10; %number of these magnet rings in the ECD
% htot=nM*h; %full length of magnet system
L=90/1000; %height of conductive cylinder
r=13.5*10^(-3);%average radius of conductive cylinder
const1= (m0)./(2.*pi);
const2=2*pi*delta1*con*R;
N2a=0;



n=0;
h=(2*n)/1000;
L=h*nM+0.02


G= 1.96*10^11; %modulus of elasticity of spring material
d= 1*10^(-3); %wire diameter
D1=11*10^(-3); %diamter spring system
M=1; %mass of experiment below
Lecd=L; %length ecd system
L2=.168; % length of stage 2
L1=0.1;

kapp=(G*d^4)/(8*(D1^3));
N2tot=(L2-Lecd)/(d+(2*M*9.8)/kapp);

N1=L1/(d+(2*M*9.8)/kapp);
ws1= sqrt((kapp)./(M.*(N1+N2a)));
ws2= sqrt((kapp)./(M.*(N2tot-N2a)));
wtot= sqrt(((ws1.^2).*(ws2.^2))./(ws1.^2+ws2.^2));
% ws1A=[ws1];
% ws2A=[ws2];
% wtotA=[wtot];


FCList= [0];
ws1A=[0];
ws2A=[0];
wtotA=[0];

for n=1:10
    disp(n)
    fprintf('Friction: [%s]\n', join(string(FCList), ','))
    h=(2*n)/1000;
    L=h*nM+0.02;
    erm3=integral(@(z) (integral(@(z1)(crossf3(z1,z)),-h/2,h/2,'ArrayValued',true).^2), -L/2,L/2,'ArrayValued',false);
    FCoef1=erm3.*const1.^2.*const2;

    FCoeftot=FCoef1*nM;
    FCoefreal=FCoeftot*(59/(10.17*10));
    %add FCoefreal2 to find this at 4K temperature
    FCList=[FCList FCoefreal];
    
    Lecd=L;
    
    N2tot=(L2-Lecd)/(d+(2*M*9.8)/kapp);
    N1=L1/(d+(2*M*9.8)/kapp);
    ws1= sqrt((kapp)./(M.*(N1+N2a)));
    ws2= sqrt((kapp)./(M.*(N2tot-N2a)));
    wtot= sqrt(((ws1.^2).*(ws2.^2))./(ws1.^2+ws2.^2));
    ws1A=[ws1A ws1];
    ws2A=[ws2A ws2];
    wtotA=[wtotA wtot];

end
x=FCList;

% wcryo=linspace(0,100*2*pi,4);
wcryo=10*2*pi

sw1A=size(ws1A)
sw2A=size(ws2A)
swtotA=size(wtotA)
H=(wtotA.^2)./(sqrt((wcryo.^2-wtotA.^2).^2+((x.*wcryo./M).*((wtotA.^2)./(ws1A.^2)).*(1-((wcryo.^2)./(ws2A.^2)))).^2))

plot(x,log10(H))
hold on;
xlabel('Friction Coeff from change of size of ECD');
ylabel('log10 Amp Atten (wcryo at 100hz)');
hold off

