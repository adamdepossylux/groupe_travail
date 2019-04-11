function r=produitn(A,x)
x=x';
t=size(x);
N=sqrt(max(t));
r=zeros(1,(N-1)^2);
n=N-1;
r(1:N)=A(3,1:N)'.*x(1:N)+A(4,1:N)'.*x(2:N+1)+A(5,1:N)'.*x(N+1:2*N);
for i=N+1:N^2-2*N
    r(i)=A(3,i)*x(i)+A(2,i)*x(i-1)+A(1,i)*x(i-N)+A(5,i)*x(i+N)+A(4,i)*x(i+1);
end
%r(N+1:N^2-N)=A(3,N+1:N^2-N)'.*x(N+1:N^2-N)+A(2,N+1:N^2-N)'.*x(N:N^2-N-1)+A(4,N+1:N^2-N)'.*x(N+2:N^2-N+1)+A(1,N+1:N^2-N)'.*x(N+1-N:N^2-2*N)+A(5,N+1:N^2-N)'.*x(2*N+1:N^2-N+N);
%r(N^2-2*N+1:N^2-N)=A(3,N^2-2*N+1:N^2-N)'.*x(N^2-N+1:N^2)+A(2,N^2-2*N+1:N^2-N)'.*x(N^2-N-1:N^2-2)+A(1,N^2-2*N+1:N^2-N)'.*x(N^2-3*N+1:N^2-2*N);
r(N^2-N+1:N^2)=A(3,N^2-N+1:N^2)'.*x(N^2-N+1:N^2)+A(2,N^2-N+1:N^2)'.*x(N^2-N:N^2-1)+A(1,N^2-N+1:N^2)'.*x(N^2-2*N+1:N^2-N);
%r=h;
%for i=N+1:N^2-2*N
%    r(i)=
%end
end