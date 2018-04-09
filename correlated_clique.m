function[dopla,edopla,A05]=correlated_clique(dopla,edopla,A0)
%% for correlated clique sets
    y=1;
    for i=1:length(A0)-1
        x=1;        
        z=1;
        clear dop edop A03 d
        A03=A0{x};
        dop=dopla(A03,:);
        edop=edopla(A03);
        for j=x+1:length(A0)
            clear dop2 edop2 A04
            A04=A0{z+1};
            dop2=dopla(A04,:);
            edop2=edopla(A04);
            %
[out]=smalcorrelation1(edop,edop2);
d(z)=max(max(out'));
z=z+1;
        end
        clear d1 d2
        d1=find(d==2);
        if numel(d1)==0
            break
        end
        d2=d1+ones(1,numel(d1));
        A05{y}=A03;
        y=y+1;
        A06=A0(d2);
        clear A0
        A0=A06;
        clear A06
        if length(A0)==0
            break
        end
        if length(A0)==1
            A05{y}=A0{x};
            break
        end
    end