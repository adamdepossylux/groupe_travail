%question 1
tic
n=[10,20,40,80,160,320];
d=6;
err=zeros(d,1);
for i=1:d
    N=n(i)+1;
    x1=linspace(0,1,N);
    x2=linspace(0,1,N);
    x2=x2';
    f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
    bord=sparse(4*N,4*N);
    uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
    [X,err(i)]=fct(f,bord,uex);
end
%plot(n(1:d),-2*log(n(1:d)))
loglog(n(1:d),err)
toc