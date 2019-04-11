tic
n=3;
N=n+1;
x1=linspace(0,1,N);
x2=linspace(0,1,N);
x2=x2';
f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
bord=sparse(4*N,4*N);
uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
err=zeros(2,1);
[X1,err(1)]=fctp2(f,bord,uex);
toc

b=sparse(N,N);
b(1,1:N)=bord(1:N);%bas
b(1:N,N)=bord(N+1:2*N);%droite
b(N,1:N)=bord(2*N+1:3*N);%haute
b(1:N,1)=bord(3*N+1:4*N);%gauche

b=f(2:n,2:n);
%disp(full(b));
b=reshape(b',(n-1)^2,1);

tic
[X2,err(2)]=fctpn(b,bord,uex);
toc