function[out]=smalcorrelation1(edop,edop2)
l1=length(edop);
l2=length(edop2);
out1=zeros(l1,l2);
for i=1:l1
    a1=edop{i};
    for j=1:l2
        a2=edop2{j};
        [r,c]=size(a1);
        n2=zeros(r,r);
        for k=1:r
            for l=1:r
                for m=1:c
                    for p=1:c
                        if a1(k,m)==a2(l,p)
                            n2(k,l)=n2(k,l)+1;
                        end
                    end
                end
            end
        end
        out1(i,j)=max(max(n2));
    end
end
% correlation matrix
clear out
out=out1+ones(l1,l2);
clear out1