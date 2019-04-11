function M=laplacien3(n,omega,eta)
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
%disp(omega)
M=sparse(N.^2,N.^2);
M(1:N,1:N)=speye(N);
for i=1:n-1
    %disp(omega(i+1,2:n))
    A2=sparse(N,N);
    A2=A;
    for j=2:n
        A2(j,j)=A(j,j)-(1/eta)*omega(i+1,j);
    end
    K=[B,A2,B];
    M(i*N+1:(i+1)*N,(i-1)*N+1:(i+2)*N)=K;
end
M(n*(n+1):(n+1).^2,n*(n+1):(n+1).^2)=speye(n+2);
end