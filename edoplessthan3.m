function[edop]=edoplessthan3(dop,n)
[r1,c1]=size(dop);
for i=1:r1
    edop1{i}(1,1)=dop(i,1);
    edop1{i}(1,2)=edop1{i}(1,1)+dop(i,2);
    edop1{i}(2,1)=n-edop1{i}(1,1);
    edop1{i}(2,2)=dop(i,2);
    edop1{i}(3,1)=n-edop1{i}(1,2);
    edop1{i}(3,2)=n-edop1{i}(2,2);
end
% celldisp(edop1);
edop=edop1';
end