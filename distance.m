function [ma,d]=distance(f,epsilon)
    r=size(f);
    N=r(1);
    f=reshape(f',N^2,1);
    T=laplacien2(N-1,epsilon)\f;
    d=epsilon*log(1./T);
    ma=max(d);
    d=reshape(d,N,N);
end

