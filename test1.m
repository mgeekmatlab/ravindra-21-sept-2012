clc
clear
close all

m0
load temp1

[dopla,edopla,A0]=all_cliques1(dop,edop,n,w,gs_max)
t1=unique(cell2mat(A0));
dop0=dopla(setdiff([1:length(dopla)],t1),:);
[edop0]=edoplessthan3(dop0,n)
[dopla,edopla,Ax]=all_cliques1(dop0,edop0,n,w,gs_max)


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
end