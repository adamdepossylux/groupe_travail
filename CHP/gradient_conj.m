function r=grad_conj(A,b,p)
n=size(b);
xk=sparse(n(1),1);
rk1=b-A*xk;
pk=rk1;
rk2=rk1;
k=0;
A*pk;
while(max(abs(rk2))>10^-p)
%for i=1:n(1)
    alpha_k=(rk1'*rk1)/(pk'*(A*pk));
    xk=xk+alpha_k*pk;
    rk2=rk1-alpha_k*A*pk;
    beta_k=(rk2'*rk2)/(rk1'*rk1);
    rk1=rk2;
    pk=rk2+beta_k*pk;
    k=k+1;
end
beta_k;
%disp(k)
r=xk;
end

%         k=0;
%     n=size(b);
%     xk=ones(n(1),1);
%     rk1=b-A*xk;
%     dk=rk1;
%     rk2=rk1;
%     %size(b)
%     for i=1:n(1)
%         qk=A*dk;
%         if (k==1)
%             dk=rk1;
%         else
%             betak=(rk1'*rk1)/(rk2'*rk2);
%             dk=rk1+betak*dk;
%         end
%         %disp(size(dk))
%         %disp(size(rk))
%         %h=(dk'*(A*rk))
%         %f=(dk'*(A*dk))
%         %dk=rk+((dk'*(A*rk))/(dk'*(A*dk)))*dk
%         %tk=(rk'*dk)/((A*dk)'*dk)
%         tk=(rk1'*b)/(dk'*qk);
%         xk=xk+tk*dk;
%         %rk=b-A*xk;
%         rk1=rk2;
%         rk2=b-A*xk;
%         k=k+1;