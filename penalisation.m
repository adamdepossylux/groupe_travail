function [X,err]=penalisation(omega,uex,eta,k)
r=size(omega);
N=r(1);
n=N-1;
M=laplacien3(N-1,omega,eta);
%disp(full(M))
b=sparse(N,N);
b(1,1:N)=k;%bas
b(1:N,N)=k;%droite
b(N,1:N)=k;%haut
b(1:N,1)=k;%gauche
b(2:n,2:n)=(-k/eta)*omega(2:n,2:n);

b=b+logical(omega==0);

%disp(full(b))
%disp(size(b))
b=reshape(b',N^2,1);
X=M\b;
%disp(reshape((M*X)',N,N))
bex=uex;
bex=reshape(bex',N^2,1);

err=norm(X-bex, Inf);

end
