%question 3
tic
N=10;
n=100;
delta=10^-2;
x1=linspace(0,1,n+1);
x2=linspace(0,1,n+1);
x2=x2';
u0=x1.*x2.*(x1-1).^3.*(x2-1).^3;
u0=reshape(u0',(n+1)^2,1);
[ma1,u1]=equ_chaleurp(N,u0,delta);
toc
size(u1);
u1=reshape(u1',n+1,n+1);
contour3(x1,x2,u1,100)
ma1