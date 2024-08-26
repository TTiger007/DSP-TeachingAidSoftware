function [Xk]=fft_j2(xn,q)
M=nextpow2(q);
N=2^M;

if length(xn)<N
    xn=[xn,zeros(1,N-length(xn))];
end
n=1:N;
x=xn(bitrevorder(n-1)+1);
for m=0:N/2-1;
    W(m+1)=exp(-j*2*pi/N)^m;
end
for L=1:M;
    B=2^(L-1);
    for J=0:B-1;
        P=2^(M-L)*J;
        for K=J:2^L:N-2;
            T=x(K+1)+x(K+B+1)*W(P+1);
            x(K+B+1)=x(K+1)-x(K+B+1)*W(P+1);
            x(K+1)=T;
        end
    end
end
Xk=x;
        

