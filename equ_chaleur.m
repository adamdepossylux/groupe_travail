function [ma,u]=equ_chaleur(N,u0,delta)
n=size(u0);
u=u0;
r=size(u0);
n=sqrt(r(1))-1;
ma=sparse(N,1);
M=laplacien(n);
%disp(full(speye((n+1)^2))-delta*M)
for i=1:N
    u=(sparse(speye((n+1)^2))-delta*M)\u;
    ma(i)=max(u);
end
end