function [ arapop ] = mutasyon( arapop,degisimOrani, populasyonBoyutu, boyut,degisimYuzdesi, alt_sinir, ust_sinir  )
%MUTASYON Summary of this function goes here
%   Detailed explanation goes here

rs=unifrnd(0,1, [populasyonBoyutu, boyut]);

for i=1:populasyonBoyutu
    for j=1:boyut
        if (rs(i,j)< degisimOrani)
            rs2=unifrnd(-1,1);
            arapop(i,j)=arapop(i,j)+rs2*degisimOrani*(ust_sinir-alt_sinir);
        end
    end

end

end

