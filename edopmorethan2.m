function[edop]=edopmorethan2(dop,edop,dop1)
[r1,c1]=size(dop1);
[r2,c2]=size(edop{1});
[r3,c3]=size(dop);
for j=1:r1
    for k=1:r3
        if dop1(j,1:c2)==dop(k,:)
            edop1{j}=edop{k};
            edop1{j}(1,c1)=edop{k}(1,c2)+dop1(j,end);
            edop1{j}(r2+1,1)=n-edop1{j}(1,c1);
            for l=1:c2                                                   
                    edop1{j}(l+1,c2+1)=edop1{j}(1,c1)-edop1{j}(1,l);                    
                    edop1{j}(r2+1,l+1)=n-edop1{j}(l+1,c2+1);                
            end
        end
    end
end
edop1=edop1';
end