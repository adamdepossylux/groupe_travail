function [X,err]=fct(f,bord,uex)
r=size(f);
N=r(1);
n=N-1;
M=laplacien(N-1);

b=sparse(N,N);
b(1,1:N)=bord(1:N);%bas
b(1:N,N)=bord(N+1:2*N);%droite
b(N,1:N)=bord(2*N+1:3*N);%haut
b(1:N,1)=bord(3*N+1:4*N);%gauche

b(2:n,2:n)=f(2:n,2:n);
%disp(full(b))
b=reshape(b',N^2,1);
X=M\b;
%X=gradient_conj(M,b,3);
%abs(M*X-b)

bex=sparse(N,N);
bex(2:n,2:n)=uex(2:n,2:n);
bex=reshape(bex',N^2,1);

err=norm(X-bex, Inf);

end