function M=laplacienp(n)
N=n+1;
h=1/n;

A=zeros(N,1);B=zeros(N,1);C=zeros(N,1);D=zeros(N,1);E=zeros(N,1);
C(1)=1;
for i=2:n
    A(i)=(1/(h^2));
    B(i)=(1/(h^2));
    C(i)=(-4/(h^2));
    D(i)=(1/(h^2));
    E(i)=(1/(h^2));
end
C(n+1)=1;
M=zeros(5,N^2);
M(3,1:N)=ones(N,1);
for i=1:n-1
    %K=[B,A,B];
    M(:,i*N+1:(i+1)*N)=[A' ; B' ; C' ; D' ; E'];
end
M(3,N^2-N+1:N^2)=ones(N,1);
end