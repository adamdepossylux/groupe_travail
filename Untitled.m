n=3;
h=0.2;
T=zeros(n+1,n+1);
X=zeros((n+1).^2,1);
for i=1:n+1
    k=[size(X(i*n:i*n+n)),size(T(1:n,i))];
    X(i*n:i*n+n)=T(1:n+1,i);
end
A=zeros(n+1,n+1);
A(1,1)=1;
for i=2:n
    A(i,i-1)=(1/h^2);
    A(i,i)=-4*(1/h^2);
    A(i,i+1)=(1/h^2);
end
A(n+1,n+1)=1;

B=(1/h^2)*eye(n+1);
B(1,1)=0;
B(n+1,n+1)=0;

M=zeros((n+1).^2,(n+1).^2);
M(1:n+1,1:n+1)=eye(n+1);
for i=2:n
    M(i*n-1:(i+1)*n-1,(i-1)*n-2:i*n-2)=B;
    M(i*n-1:(i+1)*n-1,i*n-1:(i+1)*n-1)=A;
    M(i*n-1:(i+1)*n-1,(i+1)*n:(i+2)*n)=B;
    f=[i*n+1:(i+1)*n+1,i*n:(i+1)*n];
end
N=n+1;
k=-1;
for i=1:n-1
    K=[B,A,B];
    M(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
    %M(i*N+k:(i+1)*N+k,(i-1)*N+1:i*N)=B;
    %M(i*N+k:(i+1)*N+k,(i-1)*N+1:(i+1)*N)=A;
    %M(i*N+k:(i+1)*N+k,(i+1)*N:(i+2)*N)=B;
    %k=k+1;
    %f=[i*N+1:(i+1)*N-1;i*N:(i+1)*N];
end

k=[size(M(n*(n+1):(n+1).^2,n*(n+1):(n+1).^2)),size(eye(n+2))];
M(n*(n+1):(n+1).^2,n*(n+1):(n+1).^2)=eye(n+2);

K=zeros(n+1,n+1);
K(1,1)=1;
%for i=2:n
%    K(i,i-1)=2;
%    K(i,i)=3;
%    K(i,i+1)=2;
%    f=[i*n+1:(i+1)*n+1,i*n:(i+1)*n];
%end

K(n+1,n+1)=1;
%for i=2:n
%    M(i*(n+1):(i+1)*(n+1),(i-1)*(n+1):i*(n+1))=h^2*eye(n+1);
%    M(i*(n+1):(i+1)*(n+1),i*(n+1):(i+1)*(n+1))=h^2*A;
%    M(i*(n+1):(i+1)*(n+1),(i+1)*(n+1):(i+2)*(n+1))=h^2*eye(n+2);
%end

%for i=2:n
%    M(i*(n+1):(i+1)*(n+1),(i-1)*(n+1):i*(n+1))=h^2*eye(n+2);
%    M(i*(n+1):(i+1)*(n+1),i*(n+1):(i+1)*(n+1))=h^2*A;
%    M(i*(n+1):(i+1)*(n+1),(i+1)*(n+1):(i+2)*(n+1))=h^2*eye(n+2);
%end
