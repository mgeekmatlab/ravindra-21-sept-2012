function[out]=edop2autocorrelation(a)      
%% [out]=edop2autocorrelation(Edop matrix)
% gives autocorrelation matrix for edop
a1=a;  
a2=a1;
[r c]=size(a1);
n=zeros(r,r);
for j=1:r-1
    for k=j+1:r
        n(j,k)=numel(intersect(a1(j,:),a2(k,:)));
    end
end
out=max(max(n))+1;
end