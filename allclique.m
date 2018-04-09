function[A,cliques]=allclique(m,d120)
d110=find(d120);
d10=d110;
m1=m;
y=1;
for i=1:numel(d10)
d0=d10;
d=sum(m1);
d1=max(d);
if d1>=1
d11=find(d==d1);
d2=d110(d0(d11));
x=1;
for j=1:d1+1
A{i}(x)=d2(1);
x=x+1;
if d1>=1
d3=find(m1(d11(1),:)==1);
d0=d0(d3);
m1=m1(d3,d3);
d=sum(m1);
d1=max(d);
d11=find(d==d1);
d2=d110(d0(d11));
else
    break
end
end
d110=setdiff(d110,A{i});
d10=find(d110);
m1=m(d110,d110);
else 
    break
end
A{i}=sort(A{i});
r=numel(A{1});
if numel(A{i})==r
    for k=1:numel(A{i})
    cliques(y,k)=A{i}(k);
    end
    y=y+1;
end
end
celldisp(A)
cliques