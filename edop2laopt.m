function[la,laopt]=edop2laopt(edop)% find lambda_a 
a=edop;
l2=length(a);
la=zeros(1,l2);
for i=1:l2
    la(1,i)=edop2autocorrelation(a{i});
end
laopt=unique(la);
end
%%
