%question 3
tic
N=3;
n=3;
delta=10^-2;
x1=linspace(0,1,n+1);
x2=linspace(0,1,n+1);
x2=x2';
u0=x1.*x2.*(x1-1).^3.*(x2-1).^3;
u0=reshape(u0',(n+1)^2,1);
[ma1,u1]=equ_chaleurp(N,u0,delta);
toc
tic
[ma2,u2]=equ_chaleur(N,u0,delta);
toc
size(u1);
u1=reshape(u1',n+1,n+1);
contour3(x1,x2,u1,100)
u2=reshape(u2',n+1,n+1);
figure
contour3(x1,x2,u2,100)
ma1