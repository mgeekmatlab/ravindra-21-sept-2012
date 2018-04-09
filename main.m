clc
clear all
n=67%input('enter the value of n=')
w=5%input('enter the value of w=')
%% jonson bound is calculated
disp( 'total no of codes to generate')
n1=jb(n,w)
% range of first (w-1)/2 dop eliment is 'm'
m0=floor((n-w+1)/2);
m=1:m0;
% range of next (w-1)/2 to w-1 dop elements is 'm11'
m1=floor((n-w+2)/2);
m11=1:m1;
gs_max=min(groupsize(n,w,min(1,1)));
% value of last dop element is n-(sum of all w-1 dop eliment)
%% generate incomplete dop for two eliment
x=1;
if w<=4
for i=1:numel(m)
    for j=1:numel(m11)
%         for k=1:2
if i~=j
        dop1(x,1)=m(i);
            dop1(x,2)=m11(j);
%         end
        x=x+1;
end
    end
end
% % 
else 
% %     
    for i=1:numel(m)
    for j=1:numel(m)  
        if i~=j
        dop1(x,1)=m(i);
                dop1(x,2)=m(j);
        x=x+1;
        end
    end
    end
end
dop=dop1;
clear dop1
if w==3
    [r1,c1]=size(dop);
    x=1;
    for i=1:r1
    if n-sum(dop(i,:))>floor(n/w) && any(dop(i,:)>=n-sum(dop(i,:)))==0
        dop2(x,:)=dop(i,:);
        x=x+1;
    end
    end
    clear dop
    dop=dop2
%     
    clear dop2
end
%%     generate edop from dop 
[edop]=edoplessthan3(dop)
% [r1,c1]=size(dop);
% for i=1:r1
%     edop1{i}(1,1)=dop(i,1);
%     edop1{i}(1,2)=edop1{i}(1,1)+dop(i,2);
%     edop1{i}(2,1)=n-edop1{i}(1,1);
%     edop1{i}(2,2)=dop(i,2);
%     edop1{i}(3,1)=n-edop1{i}(1,2);
%     edop1{i}(3,2)=n-edop1{i}(2,2);
% end
% % celldisp(edop1);
% edop=edop1';
% 
clear edop1
%%  generate all clique of size greater than gs-1








save temp1
[dopla,edopla,A0]=all_cliques1(dop,edop,n,w,gs_max);
%%
% return
if w==3
  [dop1,A05]=correlated_clique_set(dopla,n,w,A0);
end
%%  calculation for w>3 
if w>3
    for l=1:floor((w-1)/2)
        [dopla,edopla,A05]=correlated_clique(dopla,edopla,A0);
        y=1;
        clear A02 dopla2 edopla2
        for i=1:length(A05)
            clear  A01 dop edop dop1 edop1 dopla1 edopla1 A
                A01=A05{y};            
                dop=dopla(A01,:);
                edop=edopla(A01);
                x=1;
                % % % % % % %             if function to use
                % else
                for j=1:length(edop)
                     for k=1:numel(m11) 
                        if any(dop(j,:)==m11(k))==0
                            dop1(x,:)=[dop(j,:) m11(k)];
                            x=x+1; 
                        end    
                    end
                end 
            %             end
            %% edop generation
            [edop]=edopmorethan2(dop,edop,dop1)
%             [r1,c1]=size(dop1);
%             [r2,c2]=size(edop{1});
%             [r3,c3]=size(dop);
%             for j=1:r1
%                 for k=1:r3
%                     if dop1(j,1:c2)==dop(k,:)
%                         edop1{j}=edop{k};
%                         edop1{j}(1,c1)=edop{k}(1,c2)+dop1(j,end);
%                         edop1{j}(r2+1,1)=n-edop1{j}(1,c1);
%                         for l=1:c2                                                   
%                                 edop1{j}(l+1,c2+1)=edop1{j}(1,c1)-edop1{j}(1,l);                    
%                                 edop1{j}(r2+1,l+1)=n-edop1{j}(l+1,c2+1);                
%                         end
%                     end
%                 end
%             end
%             edop1=edop1';

            %% calculate all clique 













            [dopla1,edopla1,A]=all_cliques1(dop1,edop1,n,w,gs_max);





            dopla2{i}=dopla1;
            edopla2{i}=edopla1;
            A02{i}=A;
            y=y+1;
        end
        clear dopla edopla A0 A05 dop dop1 dopla1 edop edop1 edopla1 A A01

        z=1;
        p=1;
        for i=1:length(A02)
            for j=1:length(A02{i})
                for k=1:numel(A02{i}{j})
                    dopla(z,:)=dopla2{i}(A02{i}{j}(k),:);
                    edopla{z}=edopla2{i}(A02{i}{j}(k));
                    A002{p}(k)=z;
                    z=z+1;
                end
                p=p+1;
            end
        end
        clear A02 dopla2 edopla2
        for i=1:length(edopla)
            edopla00{i}=edopla{i}{1};
        end
        clear edopla
        edopla=edopla00';
        A0=A002;
        clear A002 edopla00
        %     if numel(dopla)=w-1
        % break
        % end
    end
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%%    calculation of clique with last dop eliment
clear edopla
x=1;
y=1;
for i=1:length(A0)
    z=1;
    for j=1:numel(A0{i})
        if n-sum(dopla(x,:))>=floor(n/w) && n-sum(dopla(x,:))<=(n-w+1) && any(dopla(x,:)>n-sum(dopla(x,:)))==0
            dop(y,:)=dopla(x,:);
            A{i}(z)=y;
            x=x+1;
            y=y+1;
            z=z+1;
        else
            x=x+1;
        end
    end
end
clear A0 dopla
for i=1:length(A)
    d01(i)=numel(A{i});
end
x=1;
for i=1:length(A)
    if d01(i)>=gs_max-1
        A0{x}=A{i};
        x=x+1;
    end
end
% 
 [dop1,A02,A05]=correlated_clique_set(dop,n,w,A0,gs_max);
 edop=dop2edop(dop1);
end