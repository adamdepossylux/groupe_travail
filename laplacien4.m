function R=laplacien4(n,delta)
N=n+1;
h=1/n;

A=sparse(N,N);
A(1,1)=1;
for i=2:n
    A(i,i-1)=(1/(h^2));
    A(i,i)=-4*(1/(h^2))-2*delta/(h^2);
    A(i,i+1)=(1/(h^2));
end
A(n+1,n+1)=1;

B=((1+delta)/(h^2))*speye(n+1);
B(1,1)=0;
B(N,N)=0;

M1=sparse(N.^2,N.^2);
M1(1:N,1:N)=speye(N);
for i=1:n-1
    K=[B,A,B];
    M1(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
end
M1(n*N:N.^2,n*N:N.^2)=speye(n+2);

A=sparse(N,N);
A(1,1)=1;
for i=2:n
    A(i,i-1)=((1+delta)/(h^2));
    A(i,i)=-4*(1/(h^2))-2*delta/(h^2);
    A(i,i+1)=((1+delta)/(h^2));
end
A(N,N)=1;

B=(1/(h^2))*speye(n+1);
B(1,1)=0;
B(N,N)=0;

M2=sparse(N.^2,N.^2);
M2(1:N,1:N)=speye(N);
for i=1:n-1
    K=[B,A,B];
    M2(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
end
M2(n*(n+1):(n+1).^2,n*(n+1):(n+1).^2)=speye(n+2);

C=sparse(N,N);
for i=2:n
    C(i,i-1)=-(delta/(4*h^2));
    C(i,i+1)=(delta/(4*h^2));
end

C1=sparse(N,N);
for i=2:n
    C1(i,i-1)=(delta/(4*h^2));
    C1(i,i+1)=-(delta/(4*h^2));
end

D=sparse(N.^2,N.^2);
for i=1:n-1
    K=[C1,sparse(N,N),C];
    D(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
end
%disp(full(M1))
%disp(full(D))
%disp(full(M2))
%R=[M1 D; D M2];
R=[M2 D; D M1];%car D est l'inverse, entre i et j confondu
%disp(full(R))                                                             
end