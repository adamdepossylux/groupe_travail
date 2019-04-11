tic
n=200;
delta=1;

%delta=(lambda+mu)/mu;
N=n+1;
x=linspace(0,1,N);
y=linspace(0,1,N);
y=y';

uex1=x.*y.^3.*(x-1).^3.*(y-1);
uex2=x.*y.*(x-1).*(y-1).^3;

f1=ones(N,N);
f2=ones(N,N);
f1=6*(1-3*x+2*x.^2).*(-1+y).*y.^3+6*(-1+x).^3.*x.*y.*(-1+2*y)+delta*(-1+y).*(-1+5*y-4*y.^2+6*y.^3+12*x.^2.*y.^3-2*x.*(-1+5*y-4*y.^2+9*y.^3));
f2=2*(-1+y).^3.*y+6*(-1+x).*x.*(1-3*y+2*y.^2)+delta*(-1+x).*(y.^2.*(-3+4*y)+4*x.^2.*y.^2.*(-3+4*y)+x.*(6-18*y+27*y.^2-20*y.^3));
bord=sparse(4*N,1);
[X1,X2,err1,err2]=fct2(delta,f1,f2,bord,bord,uex1,uex2);

toc
disp(err1)
disp(err2)
figure(1)
contour3(x,y,X1,100)
%contourf(x,y,X1)
title(['u1 calculé'])
figure(2)
contour3(x,y,uex1,100)
%contourf(x,y,uex1)
 title(['u1 exacte'])
figure(3)
contour3(x,y,X2,100)
%contourf(x,y,X2)
 title(['u2 calculé'])
figure(4)
contour3(x,y,uex2,100)
%contourf(x,y,uex2)
title(['u2 exacte'])
figure (5)
contour3(x,y,f1,100)
title(['f1 exacte'])
figure (6)
contour3(x,y,f2,100)
title(['f2 exacte'])