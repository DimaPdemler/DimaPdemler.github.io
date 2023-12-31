
%author: Dmitri Demler

%graphs how magnetic fields change when the point moves in the radial
%direction



clear
m0=1.28; %magnetization magnet (tesla)
miu0=4*pi*10^(-7); %constant
% delta1=1/1000; %thickness
% R=12/1000;%average radius conductive cylinder
con=5.8*10^7*172; %conductivity copper conductor
b1=2/1000; %radius of the magnet
b2= 6/1000;
% b=7/1000;

L=12/1000; %length of magnet

% r=6/1000;%also average radius of conductive cylinder?
const1= (m0)./(2.*pi);
% const2=2*pi*delta1*con*R;
% const3=2*pi*delta1*con*R;
nM=5; %number of these magnet systems

syms z1 t k1 

z=5/1000;


k1= @(z1, r) (4.*b1.*r)./(((b1+r).^2)+(z-z1).^2);
k3= @(z1, r) (4.*b2.*r)./(((b2+r).^2)+(z-z1).^2);


E1=@(z1,r) (ellipticK(k1(z1,r)));
E2=@(z1,r) (ellipticE(k1(z1,r)));
E3=@(z1,r) (ellipticK(k3(z1,r)));
E4=@(z1,r) (ellipticE(k3(z1,r)));

doss1=@(z1,r) 1./(((b1+r).^2+(z-z1).^2).^(1/2));
doss2=@(z1,r) E1(z1,r).*((b1.^2-r.^2-(z-z1).^2)./((b1-r).^2+(z-z1).^2))+E2(z1,r);
doss3=@(z1,r) 1./(((b2+r).^2+(z-z1).^2).^(1/2));
doss4=@(z1,r) E3(z1,r).*((b2.^2-r.^2-(z-z1).^2)./((b2-r).^2+(z-z1).^2))+E4(z1,r);

dossf1=@(z1,r) (doss3(z1,r).*doss4(z1,r)-doss1(z1,r).*doss2(z1,r))*(m0)./(2.*pi);

erm1=@(r) integral(@(z1)(dossf1(z1,r)),-L/2,L/2);


%graphs the magnetic field strength in the axial direction
figure('Name', 'MagneticField in z direction z=10mm' )
 fplot(@(r) erm1(r),[(b2+0.001) 0.05],'b')
 hold on
 xline(b2)
 ylabel('magnetic field strength (Tesla)');
 xlabel('radial distance from center')
 hold off


k1= @(z1,r) (4.*b1.*r)./(((b1+r).^2)+(z-z1).^2);
k2= @(z1,r) (4.*b2.*r)./(((b2+r).^2)+(z-z1).^2);

E1=@(z1,r) (ellipticK(k1(z1,r)));
E2=@(z1,r) (ellipticE(k1(z1,r)));
E3=@(z1,r) (ellipticK(k2(z1,r)));
E4=@(z1,r) (ellipticE(k2(z1,r)));

%This is the integrand split into two parts and then multiplied together
cross1= @(z1,r) (z-z1)./(r.*(((b1+r).^2+(z-z1).^2)).^(1./2));
cross2= @(z1,r) (-1).*E1(z1,r)+((((b1+r).^2+(z-z1).^2)./((b1-r).^2+(z-z1).^2)).*E2(z1,r));
crossf1= @(z1,r) (cross1(z1,r).*cross2(z1,r));

%This is the second inegrand...
cross3= @(z1,r) (z-z1)./(r.*(((b2+r).^2+(z-z1).^2)).^(1./2));
cross4= @(z1,r) (-1).*E3(z1,r)+((((b2+r).^2+(z-z1).^2)./((b2-r).^2+(z-z1).^2)).*E4(z1,r));
crossf2= @(z1,r) (cross3(z1,r).*cross4(z1,r));

%Subtracts the outer diameter from the inner diameter to make the ring
crossf3 = @(z1,r) crossf2(z1,r)-crossf1(z1,r);


%graphs magnetic field in the radial direction
erm11=@(r)integral(@(z1)(crossf3(z1,r)),-L/2,L/2);
figure('Name', 'MagneticField in radial direction z=10' )
fplot(@(r) erm11(r),[(b2+0.001) 0.05],'b')
hold on
%  xline(b2)
 ylabel('magnetic field strength (Tesla)');
 xlabel('radial distance from center')

hold off

bmag=@(r) sqrt(erm1(r).^2+erm11(r).^2)
figure('Name', 'Magnitude of Magnetic Field z=10' )
fplot(@(r) bmag(r),[(b2+0.001) 0.05],'b')
hold on
 ylabel('magnetic field strength (Tesla)');
 xlabel('radial distance from center')
%  xline(b2)
 hold off

