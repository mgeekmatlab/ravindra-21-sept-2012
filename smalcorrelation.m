function[out3]=smalcorrelation(edopla1,edopla2)
l1=length(edopla1);
l2=length(edopla2);
out1=zeros(l1,l2);
for i=1:l1
    a1=edopla1{i};
    for j=1:l2
        a2=edopla2{j};
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
out=out1+ones(l1,l2);
clear out1
% graph formation
[r,c]=size(out);
a11=1:r;
a12=1:c;
for i=1:r
    for j=1:c
        if out(i,j)==1
            out3(i,j)=1;
        else
            out3(i,j)=0;
        end
    end
end
out3;