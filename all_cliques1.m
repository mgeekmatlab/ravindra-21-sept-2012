function[dopla,edopla,A0]=all_cliques1(dop,edop,n,w,gs_max)
%% generate dop edop of lambda=1
[la,laopt]=edop2laopt(edop);
%         disp('enter choice for lambda_a \n options for lambda_a are =')
%         disp(laopt)
        laused=1%input('')
        clear dopla edopla dopno
        %% dopla has autocorrelation value '1' 
        [dopla,edopla,dopno]=doplaf0(dop, edop, la, laused);
        clear dop edop
%%      small correlation matrix formation
[r,c]=size(dopla);
x=1;
y=1;
for i=1:r
    if dopla(i,1)==dopla(1,1)
        dopla1(x,:)=dopla(i,:);
        edopla1{x}=edopla{i};
        x=x+1;
    else
        dopla2(y,:)=dopla(i,:);
        edopla2{y}=edopla{i};
        y=y+1;
    end
end
edopla1=edopla1';
edopla2=edopla2';
% 
[out2]=smalcorrelation(edopla1,edopla2);
out21=out2;
[r1,c1]=size(out2);
a112=1:r1;
a122=1:c1;

%%       
for k=1:r1
    [r,c]=size(out2);
a11=1:r;
a12=1:c;
d=sum(out2');
d1=max(d);
d11=find(d==d1);
A{k}(1)=a112(a11(d11(1)));
x=1;
for i=1:c
    if out2(a11(d11(1)),i)==1
        A1(x)=a122(a12(i))+r1;
        x=x+1;
    end
end
clear dopla1 dopla2 edopla1 edopla2
dopla3=dopla(A1,:);
edopla3=edopla(A1);

for i=1:length(edopla3)
    x=1;
    y=1;
    a0=dopla3(1,1);
%  
clear r0 c0 dopla03 ro1 r00
% for cheking first eliment of dop
[r0,c0]=size(dopla3);
for l=1:r0
    dopla03(l)=dopla3(l,1);
end
r01=dopla03(1);
% % % % 
r00=find(dopla03==r01);
if numel(dopla03)==numel(r00)
%     to insert one code
    A{k}(i+1)=A1(1);
    break
end
% 
  for j=1:length(edopla3)
    if dopla3(j,1)==a0
        dopla1(x,:)=dopla3(j,:);
        edopla1{x}=edopla3{j};
        a13(x)=A1(j);
        x=x+1;
    else
        dopla2(y,:)=dopla3(j,:);
        edopla2{y}=edopla3{j};
        a14(y)=A1(j);
        y=y+1;
    end
  end
    edopla1=edopla1';
    edopla2=edopla2';
%% 
% 
clear out3
[out3]=smalcorrelation(edopla1,edopla2);
clear out d d1 d11 r c a11 a12
d=sum(out3');
% 
[r,c]=size(out3);
if c==1 
   if d~=0
    for j=1:r
        if out3(j,c)==1
        A{k}(i+1)=a13(j);
        A{k}(i+2)=a14(1);
        break
        end
    end
    break
else
    A{k}(i+1)=a13(1);
    break
   end
end
% 
% d=sum(out3');
if d==0 
    A{k}(i+1)=a13(1);
    break
end
d1=max(d);
d11=find(d==d1);
A{k}(i+1)=a13(d11(1));
% [r,c]=size(out3);
a11=1:r;
a12=1:c;
x=1;
clear A1
% 
% if c==1
%     break
% end
% 
for l=1:c
    if out3(d11(1),l)==1
        A1(x)=a14(l);
        x=x+1;
    end
end
clear dopla1 dopla2 edopla1 edopla2 dopla3 edopla3 a13 a14 dopla03 r00
dopla3=dopla(A1,:);
edopla3=edopla(A1);
%% 
% [r0,c0]=size(dopla3);
% for l=1:r0
%     dopla03(l)=dopla3(l,1);
% end
% r01=dopla03(1);
% r00=find(dopla03==r01);
% if numel(dopla03)==numel(r00)
% %     to insert one code
% %     A{k}(i+1)=A1(1);
%     break
% end
if length(edopla3)==1
    A{k}(i+2)=A1(1);
    break
end
end
a112=setdiff(a112,A{k}(1));
a122=setdiff(a122,(setdiff(A{k},A{k}(1)))-r1);
out2=out21(a112,a122);
end
%% 
for i=1:r1
    d01(i)=numel(A{i});
end
x=1;
for i=1:r1
    if d01(i)>=gs_max-1
        A0{x}=A{i};
        x=x+1;
    end
end