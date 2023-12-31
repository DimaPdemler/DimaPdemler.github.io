clear
Ellipticconstants;

%calculates the amplitude attentuation of a spring-ECD-spring system
%depending on how long the ECD is. These calculations can be found on the
%calculations file in Dmitri personal



G= 1.96*10^11; %modulus of elasticity of spring material
d= 1*10^(-3); %wire diameter

D1=11*10^(-3); %diamter spring system
M=1; %mass of experiment below


Lecd=0.06; %length ecd system
L2=.168; % length of stage 2
L1=0.1;
kapp=(G*d^4)/(8*(D1^3));
Nsum=(L1+L2-Lecd)/(2*d+(2*M*9.8)/kapp)


xStretched=(2*M*9.8)*Nsum/kapp

[N2,wcryo] = meshgrid(0:1:Nsum,0:pi:100*(2*pi));



ws1= sqrt((kapp)./(M.*(Nsum-N2)));
ws2= sqrt((kapp)./(M.*(N2)));
wtot= sqrt(((ws1.^2).*(ws2.^2))./(ws1.^2+ws2.^2));
% wcryo=0.01/(2*pi);
H=(wtot.^2)./(sqrt((-wcryo.^2+wtot.^2).^2+((FCoef.*wcryo./M).*((wtot.^2)./(ws1.^2)).*(-1+((wcryo.^2)./(ws2.^2)))).^2));



surf(N2,wcryo./(2.*pi),log10(H))

hold on;
zlabel('log10 of Amplitude Attenuation (4K)');
xlabel('number spring coils below ECD');
ylabel('frequency');
% zlim([-inf 15])
colorbar
hold off;
