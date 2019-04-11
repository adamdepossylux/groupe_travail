n=40;
N=n+1;
h=1/n;

A=sparse(N,N);
A(1,1)=1;
for i=2:n
    A(i,i-1)=(1/(h^2));
    A(i,i)=-4*(1/(h^2));
    A(i,i+1)=(1/(h^2));
end
A(n+1,n+1)=1;
B=(1/(h^2))*speye(n+1);
B(1,1)=0;
B(N,N)=0;

M=sparse(N.^2,N.^2);
M(1:N,1:N)=speye(N);
for i=1:n-1
    K=[B,A,B];
    M(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
end
M(n*(n+1):(n+1).^2,n*(n+1):(n+1).^2)=speye(n+2);

nn=n+1;
x1=linspace(0,1,N);
x2=linspace(0,1,N);
x2=x2';
f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
b=zeros(N);
b(2:n,2:n)=f(2:n,2:n);
b=reshape(b',N^2,1);
X=inv(M)*b;

uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
bex=zeros(N);
bex(2:n,2:n)=uex(2:n,2:n);
bex=reshape(bex',N^2,1);

err=norm(X-bex, Inf)
errmax=max(abs(bex-X))

