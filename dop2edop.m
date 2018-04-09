function[edop]=dop2edop(dop)
%% GENERATE EDOP FORM DOP
edop=[];
[r1,c1]=size(dop);
for j=1:r1
    x=dop(j,:);
    r=length(x);
    y=[];
    for i=1:r-1
        if i==1
            y=x;
            x=circshift(x',-1)';
        end
        if i>1
            y(i,:)=y(i-1,:)+x;
            x=circshift(x',-1)';
        end
    end
    edop{j,1}=y';
end
clear r c i x y
end