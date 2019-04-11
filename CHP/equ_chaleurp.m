function [ma,u]=equ_chaleurp(N,u0,delta)
u=u0';
r=size(u0);
n=sqrt(r(1))-1;
ma=zeros(N,1);
M=laplacienp(n);
oneone=zeros(5,(n+1)^2);
oneone(3,:)=1;
for i=1:N
    u=gjp((oneone-delta*M),u',6);%gjp renvoie pas un vecteur dans le bon sens, il faut donc prendre la transposé et donc la transposé de u0 à la base
    %u=(sparse(speye((n+1)^2))-delta*M)\u;
    ma(i)=max(u);
end
end