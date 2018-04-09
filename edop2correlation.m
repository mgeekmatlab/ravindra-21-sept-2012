function[out]=edop2correlation(EDoP)
%% creat correlation matrix from EDoP matrix
%global displayoff
clc
disp('generating correlation matrix')
switch 1%displayoff
    case 1
        a=EDoP;
        l2=length(a);
        out1=zeros(l2,l2);
        for i=1:l2
            a1=a{i};
            for i2=i:l2
                a2=a{i2};
                [r c]=size(a1);
                n=zeros(r,r);
                if i==i2
                    for j=1:r-1
                        for k=j+1:r
                            for l=1:c
                                for m=1:c
                                    if a1(j,l)==a2(k,m)
                                        n(j,k)=n(j,k)+1;
                                    end
                                end
                            end
%                             n(j,k)=numel(intersect(a1(j,:),a2(k,:)));
                        end
                    end
                end
                if i~=i2
                    for j=1:r
                        for k=1:r
                            for l=1:c
                                for m=1:c
                                    if a1(j,l)==a2(k,m)
                                        n(j,k)=n(j,k)+1;
                                    end
                                end
                            end
%                             n(j,k)=numel(intersect(a1(j,:),a2(k,:)));
                        end
                    end
                end
                out1(i,i2)=max(max(n));
            end
        end
        a=out1;
        out2=a+a'-diag(diag(a));
        out=out2+ones(l2,l2);
        % out is corelation value
        clear a l2 out1 i a1 i2 r c i j k l m n
    otherwise
        a=EDoP;
        l2=length(a);
        out1=zeros(l2,l2);
        disp('generation correlation matris of size')
        disp(l2)
        for i=1:l2
            clc
            disp('generation correlation matris of size')
            disp(l2)
            disp('working with row no ')
            disp(i)
            disp(' out of ')
            disp(l2)
            a1=a{i};
            for i2=i:l2
                a2=a{i2};
                [r c]=size(a1);
                n=zeros(r,r);
                if i==i2
                    for j=1:r-1
                        for k=j+1:r
                            for l=1:c
                                for m=1:c
                                    if a1(j,l)==a2(k,m)
                                        n(j,k)=n(j,k)+1;
                                    end
                                end
                            end                            
%                             n(j,k)=numel(intersect(a1(j,:),a2(k,:)));
                        end
                    end
                end
                if i~=i2
                    for j=1:r
                        for k=1:r
                            for l=1:c
                                for m=1:c
                                    if a1(j,l)==a2(k,m)
                                        n(j,k)=n(j,k)+1;
                                    end
                                end
                            end                            
%                            n(j,k)=numel(intersect(a1(j,:),a2(k,:)));
                        end
                    end
                end
                out1(i,i2)=max(max(n));
            end
        end
        a=out1;
        out2=a+a'-diag(diag(a));
        out=out2+ones(l2,l2);
        % out is corelation value
        clear a l2 out1 i a1 i2 r c i j k l m n 
    end
end
        
%%

            
        
        
    