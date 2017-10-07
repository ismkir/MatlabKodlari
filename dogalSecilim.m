function [ arapop ] = dogalSecilim( populasyon, obj, populasyonBoyutu )
%DOGALSECÝLÝM Summary of this function goes here
%   Detailed explanation goes here
obj=1./obj;

sumobj=sum(obj);
probs=obj/sumobj;
cprobs=probs;

for i=2:populasyonBoyutu
    cprobs(i)=cprobs(i-1)+probs(i);
end

rs=unifrnd(0,1, [populasyonBoyutu, 1]);
arapop=populasyon;

for i=1:populasyonBoyutu
    idx=find(rs(i) < cprobs,1);
    arapop(i,:)=populasyon(idx,:);
end

end

