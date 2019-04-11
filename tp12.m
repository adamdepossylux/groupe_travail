%question 2
tic
n=400;
N=n+1;
alpha=1;
beta=1;
x1=sparse(linspace(0,1,N));
x2=sparse(linspace(0,1,N));
x2=x2';
f=zeros(N,N);
bord=sparse(4*N,1);
x=sparse(linspace(0,1,N));
xb=sparse(linspace(0,1,N));
bord(1:N)=alpha*x.*(1/2-x).*(x<=0.5);
bord(2*N+1:3*N)=beta*(x-1/2).*(1-x).*(x>=0.5);

b=sparse(N,N);
b(1,1:N)=bord(1:N);%bas
b(1:N,N)=bord(N+1:2*N);%droite
b(N,1:N)=bord(2*N+1:3*N);%haut
b(1:N,1)=bord(3*N+1:4*N);%gauche
figure (1)
plot(x,b(1,:))
figure (2)
plot(x,b(N,:))

uex=x.*x2.*(x1-1).^3.*(x2-1).^3;
[X,err]=fct(f,bord,uex);
X=reshape(X',N,N);

figure
%plot(x1,X(1,:),x1,X(2,:),x1,X(3,:),x1,X(4,:),x1,X(5,:))
%legend(['1'],['2'],['4'],['5'])
plot(x,X(floor(N/2)+1,:))
figure (3)
contourf(x1,x2,X)
%err
figure (4)
plot(x,X(N-1,:))
figure (5)
plot(x,X(2,:))
toc