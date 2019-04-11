function [X1,X2,err1,err2]=fct2(delta,f1,f2,bord1,bord2,uex1,uex2)
r=size(f1);
N=r(1);
n=N-1;
M=laplacien4(N-1,delta);
b1=sparse(N,N);
b1(1,1:N)=bord1(1:N);%bas
b1(1:N,N)=bord1(N+1:2*N);%droite
b1(N,1:N)=bord1(2*N+1:3*N);%haut
b1(1:N,1)=bord1(3*N+1:4*N);%gauche
b1(2:n,2:n)=f1(2:n,2:n);
%disp(full(b1))
%b1=flip(b1);
b1=b1';
b1=b1(:);
%disp(full(b1))

b2=sparse(N,N);
b2(1,1:N)=bord2(1:N);%bas
b2(1:N,N)=bord2(N+1:2*N);%droite
b2(N,1:N)=bord2(2*N+1:3*N);%haut
b2(1:N,1)=bord2(3*N+1:4*N);%gauche
b2(2:n,2:n)=f2(2:n,2:n);
%disp(full(b2))
%b2=flip(b2); %il n'y en as pas parce que la matrice est aussi construite à l'envers
b2=b2';
b2=b2(:);
%disp(full(b2))
b=[b1 ; b2];
%disp(full(b))
X=M\b;

bex1=sparse(N,N);
bex1(2:n,2:n)=uex1(2:n,2:n);
%disp(full(bex1))
bex1=reshape(bex1',N^2,1);
%disp(full(bex1))
bex2=sparse(N,N);
bex2(2:n,2:n)=uex2(2:n,2:n);
bex2=reshape(bex2',N^2,1);
%bex=[bex1 bex2];
%bex=reshape(bex',2*N^2,1);

X1=X(1:N^2);
X2=X(N^2+1:2*N^2);

err1=norm(X1-bex1, Inf);
err2=norm(X2-bex2, Inf);
%X1=X1;
%disp(full([X1; X2] == X))
X1=reshape(X1,N,N)';
%disp(full(X2))
X2=reshape(X2,N,N)';%attention grosse erreur, on en prend pas la transposé d'un vecteur !!!
%disp(full(X2))
end