function r=gjp(A,b,p)
%b=b';
n=size(b);
%disp(n)
xk=sparse(n(1),1)';
xk'
%rk1=b-produit(A,xk')';
rk1=b-produit(A,xk')';
pk=rk1;
rk2=rk1;
k=0;
%pk
%h=produit(A,pk');
%size(pk);
while(max(abs(rk2))>10^-p)
%for i=1:n(1)-1
%     d=A;
%     e=pk';
%     a=produit(A,pk')';
%     b=pk';
%     h=b*a;
    alpha_k=(rk1'*rk1)/(pk'*(produit(A,pk')'));
    xk=xk+alpha_k*pk';
    rk2=rk1-alpha_k*produit(A,pk')';
    beta_k=(rk2'*rk2)/(rk1'*rk1);
    rk1=rk2;
    pk=rk2+beta_k*pk;
    k=k+1;
end
%disp(h)
%disp(e)
%disp(a)
r=xk;
end