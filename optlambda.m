function[la,lc]=optlambda(correlation)
%% [options for la,options for lc]=optlambda(correlation)
%% take corelation matrix & give us the options of lambda_a & lambda_c
la=unique(diag(correlation))';
lc1=unique(correlation-diag(diag(correlation)))';
lc=lc1(2:length(lc1));
end
%%

