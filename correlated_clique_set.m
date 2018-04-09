function[dop1,A02,A05]=correlated_clique_set(dopla,n,w,A0,gs_max)
    [r2,c2]=size(dopla);
    for i=1:r2
        dop1(i,:)=[dopla(i,:),n-sum(dopla(i,:))];
    end         
    x=1;
    for i=1:length(A0)
        clear A01
        A01=A0{i};       
        dop=dop1(A01,:);        
        clear dopla edopla
        [edop]=dop2edop(dop);
        %% generate dop edop lambda_1 1end
        [la laopt]=edop2laopt(edop);
        disp('enter choice for lambda_a \n options for lambda_a are =')
        disp(laopt)
        laused=1%input('')
        clear dopla1 edopla1 dopno
        %% dopla has autocorrelation value '1' 
        [dopla1,edopla1,dopno]=doplaf0(dop, edop, la, laused);
        clear dop edop
        %%         correlation matrix formation
        clear correlationla correlation maximal_clique1
        correlationla=edop2correlation(edopla1);
        correlation=correlationla;
        %% generate matrix for graph
        clc
for i=1:numel(dopno)
    for j=1:numel(dopno)
        if i==j
            correlationla(i,j)=0;
        elseif correlationla(i,j)>1
            correlationla(i,j)=0;
        else
            correlationla(i,j)=1;
        end
    end
end
    correlationla;
    maximal_clique1=maximal_clique(correlationla,dopno);
    A02{x}=A01(dopno(maximal_clique1));
    x=x+1;    
    end
    x=1;
    for i=1:length(A02)
        if numel(A02{i})>=gs_max-1
            A002{x}=A02{i};
            x=x+1;
        end
    end
    clear A02
    A02=A002;
    clear A002
    %% for correlated clique sets
    y=1;
    for i=1:length(A02)
        x=1;        
        z=1;
        clear dop edop A03 d
        A03=A02{x};
        dop=dop1(A03,:);
        edop=dop2edop(dop);
        for j=x+1:length(A02)
            clear dop2 edop2 A04
            A04=A02{z+1};
            dop2=dop1(A04,:);
            edop2=dop2edop(dop2);
            %
[out]=smalcorrelation1(edop,edop2);
d(z)=max(max(out'));
z=z+1;
        end
        A05{y}=A03;
        y=y+1;
        clear d1 d2
        d1=find(d==2);
        if numel(d1)==0
            break
        end
        d2=d1+ones(1,numel(d1));
        A06=A02(d2);
        clear A02
        A02=A06;
        clear A06
        if length(A02)==0
            break
        end
        if length(A02)==1
            A05{y}=A02;
            break
        end
    end