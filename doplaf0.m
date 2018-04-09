function[dopla,edopla,dopno]=doplaf0(dop, edop, la, laused)
%% la is autocorrelation of dops, laused is desired autocorrelation,
%% dopla is dop of codes having desired autocorrelation only,
%% edopla is edop of codes having desired autocorrelation only,
%% dopno is no of codes having desired autocorrelation only
num=1;
x=length(la);
for i=1:x
    if laused>=la(1,i)
        dopla(num,:)=dop(i,:);
        edopla{num,1}=edop{i,1};
        dopno(1,num)=i;
        num=num+1;
    end
end
clear x i num
end