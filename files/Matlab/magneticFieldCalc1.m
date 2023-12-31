clear
m0=1.28; %magnetization magnet (tesla)
miu0=4*pi*10^(-7); %constant

con=5.8*10^7*172; %conductivity copper conductor
b1=2.5/1000; %radius of the magnet
b2= 6/1000;


L=12/1000; %length of magnet


const1= (m0)./(2.*pi);


syms z1 t k1 
r=15/1000; %radial distance of point we want to find magnetic field
z=300/1000; %axial distance of point we want to find magnetic field


k1= @(z1) (4.*b1.*r)./(((b1+r).^2)+(z-z1).^2);
k3= @(z1) (4.*b2.*r)./(((b2+r).^2)+(z-z1).^2);


E1=@(z1) (ellipticK(k1(z1)));
E2=@(z1) (ellipticE(k1(z1)));
E3=@(z1) (ellipticK(k3(z1)));
E4=@(z1) (ellipticE(k3(z1)));

doss1=@(z1) 1./(((b1+r).^2+(z-z1).^2).^(1/2));
doss2=@(z1) E1(z1).*((b1.^2-r.^2-(z-z1).^2)./((b1-r).^2+(z-z1).^2))+E2(z1);
doss3=@(z1) 1./(((b2+r).^2+(z-z1).^2).^(1/2));
doss4=@(z1) E3(z1).*((b2.^2-r.^2-(z-z1).^2)./((b2-r).^2+(z-z1).^2))+E4(z1);

dossf1=@(z1) (doss3(z1).*doss4(z1)-doss1(z1).*doss2(z1))*(m0)./(2.*pi);

erm1= integral(@(z1)(dossf1(z1)),-L/2,L/2);


fprintf(['The magnetic field of one magnet at ', num2str((z)*1000), ' mm from the magnet (z direction) is ', num2str(erm1*10000), ' gaus \n'])


k1= @(z1) (4.*b1.*r)./(((b1+r).^2)+(z-z1).^2);
k2= @(z1) (4.*b2.*r)./(((b2+r).^2)+(z-z1).^2);

E1=@(z1) (ellipticK(k1(z1)));
E2=@(z1) (ellipticE(k1(z1)));
E3=@(z1) (ellipticK(k2(z1)));
E4=@(z1) (ellipticE(k2(z1)));

%This is the integrand split into two parts and then multiplied together
cross1= @(z1) (z-z1)./(r.*(((b1+r).^2+(z-z1).^2)).^(1./2));
cross2= @(z1) (-1).*E1(z1)+((((b1+r).^2+(z-z1).^2)./((b1-r).^2+(z-z1).^2)).*E2(z1));
crossf1= @(z1) (cross1(z1).*cross2(z1));

%This is the second inegrand...
cross3= @(z1) (z-z1)./(r.*(((b2+r).^2+(z-z1).^2)).^(1./2));
cross4= @(z1) (-1).*E3(z1)+((((b2+r).^2+(z-z1).^2)./((b2-r).^2+(z-z1).^2)).*E4(z1));
crossf2= @(z1) (cross3(z1).*cross4(z1));

%Subtracts the outer diameter from the inner diameter to make the ring
crossf3 = @(z1) crossf2(z1)-crossf1(z1);

erm11= integral(@(z1)(crossf1(z1)),-L/2,L/2);

bmag=sqrt(erm1.^2+erm11.^2);


fprintf(['The magnetic field of one magnet at ', num2str(r*1000), ' mm from the center (radial direction) is ', num2str(erm11*10000), ' gaus \n'])

fprintf(['Magnitude of magnetic field is ', num2str(sqrt(r.^2+z.^2)*1000), ' mm from the magnet is ', num2str(bmag*10000), ' gaus \n'])
