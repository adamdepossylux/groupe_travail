%distance
tic
epsilon=10^-3;
n=100;
N=n+1;
f=sparse(N,N);
f(1,1:N)=1;%bas
f(1:N,N)=1;%droite
f(N,1:N)=1;%haut
f(1:N,1)=1;%gauche
%f(N/2,N/2)=1;
N=n+1;
r=0.1;
x1=sparse(linspace(0,1,N));
x2=sparse(linspace(0,1,N));
x2=x2';
%f=logical((x1-1/2).^2+(x2-1/2).^2>r^2);
[ma,d]=distance(f,epsilon);
figure (1)
contourf(x1,x2,f)
figure (2)
contourf(x1,x2,abs(d),d)
toc