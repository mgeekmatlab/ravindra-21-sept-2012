function[gs]=groupsize(n,w,la)
%groupsize=(n,w,la) 1<=lambda<hammingweight
gs=1;
for i=la:-1:1
    gs=floor((gs*(n-i))/(w-i));
%     gs=gs*floor(((n-i))/(w-i));
end
gs=floor(gs/w);
end
%%
