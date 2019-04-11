tic
epsilon=10^-3;
delta=1;
n=300;
N=n+1;
f=zeros(N,N);
N=n+1;
x1=linspace(0,1,N);
x2=linspace(1,0,N);
x2=x2';
uex1=x1.*x2.^3.*(x1-1).^3.*(x2-1);
uex2=x1.*x2.*(x1-1).*(x2-1).^3;
f1=sparse(N,N);
f2=sparse(N,N);
%[x1,x2]=meshgrid(x1,x2);
r=0.1;
deca=0.25;
c=0.5;
h=0.75;
f1=((x1-c+deca).^2+(x2-h).^2<r^2);
f1=f1+((x1-c-deca).^2+(x2-h).^2<r^2);
r2=0.1;
e=0.04;
f2=((((x1-0.5).^2+(x2-0.2).^2<r2^2) & ((x1-0.5).^2+(x2-0.2).^2>(r2-e)^2)) & (x2>=0.2 & 0.3>=x2))+f1;
f1=f1+((x2>=0.2 & 0.3>=x2) & (0.4<x1 & x1<0.6));
%f2=(((x1-0.5).^2+(x2-0.21).^2<=0.2^2) & ((x1-0.5).^2+(x2-0.21).^2>=0.2^2)) & (0.35<x1 & x1<0.65);
%f=f1+f2;
%nx=sum((x2>=0.2 & 0.3>=x2) & (0.4<x1 & x1<0.6));
%ny=sum((x2>=0.2 & 0.3>=x2) & (0.4<x1 & x1<0.6),2);
omega=((x2>=0.2 & 0.3>=x2) & (0.4<x1 & x1<0.6));
f1=(f1==0);
f2=(f2==0);
[ma,d1]=penalisation(omega,distance(f1,epsilon),eta,k);
[ma,d2]=distance(f2,epsilon);
[ma,d]=distance(f,epsilon);
bord=1*ones(4*N, 1);
[X1,X2,err1,err2]=fct2(delta,f1,f2,bord,bord,uex1,uex2);
figure
contourf(x1,x2,f1)
title(['f1'])
figure (2)
contourf(x1,x2,f2)
title(['f2'])
%figure
%contour3(x1,x2,abs(d1)',100)
%title(['solution 1'])
figure
contour3(x1,x2,abs(X2),100)
title(['solution 2'])
figure (5) 
contour3(x1,x2,abs(X1),100)
title(['Solution 1'])
toc