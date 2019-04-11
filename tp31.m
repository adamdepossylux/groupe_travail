tic
r=0.3;
eta=10^-8;
k=(1/4)*r^2;
n=[10,20,40,160,320];
for i=1:5
    N=n(i)+1;
    x1=sparse(linspace(0,1,N));
    x2=sparse(linspace(0,1,N));
    x2=x2';
    omega=logical((x1-1/2).^2+(x2-1/2).^2>r^2);
    uex1=0.25.*((x1-1/2).^2+(x2-1/2).^2);%en calculant la dérivée on obtient le coefficient 2+2=4
    uex=uex1.*logical(omega==0);
    uex=uex+omega*k;
    [X,err(i)]=penalisation(omega,uex,eta,k);
end
figure (1)
contour3(x1,x2,omega,100)
X=reshape(X',N,N);
figure (2)
contour3(x1,x2,X,100)
figure (3)
contour3(x1,x2,uex,100)
figure (4)
loglog(n,err)
toc