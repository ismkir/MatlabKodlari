function [objIt, enIyiDeger, enIyiCozum,  ] = ga( alt_sinir, ust_sinir, boyut, populasyonBoyutu, caprazlamaOrani, degisimOrani, degisimYuzdesi, iterasyonSayisi, kabulSiniri )

% Fonksiyonu test etmek için aþaðýdaki satýrý Matlab komut satýrýna yazmanýz yeterlidir.

% [ objIt, enIyiDeger, enIyiCozum ] = ga( -1, 1, 4, 40, 0.95, 0.02, 0.09, 100, 0.005 )

% --------------------------------------
% Hazýrlayan: Ýsmail KIRBAÞ
% Tarih: 7 Ekim 2017

%% Örnek çalýþma parametreleri

% alt_sinir=-1 
% ust_sinir=-1
% boyut=4
% populasyonBoyutu=40
% caprazlamaOrani=0.95
% degisimOrani=0.02 (mutasyon)
% degisimYuzdesi=0.09 (delta)
% iterasyonSayisi=100
% kabulSiniri=0.005

clc;
populasyon=unifrnd(alt_sinir, ust_sinir, [populasyonBoyutu, boyut])

if (iterasyonSayisi > 1000) 
    iterasyonSayisi=1000;
end

if (populasyonBoyutu > 1000)
    populasyonBoyutu=1000; 
end

if (caprazlamaOrani>0.99 || caprazlamaOrani<0.01)
    caprazlamaOrani=0.95;
end

if (degisimOrani>0.2 || degisimOrani<0.001)
    degisimOrani=0.02;
end

if (degisimYuzdesi<0.001 || degisimYuzdesi>0.9)
    degisimYuzdesi=0.09;
end

iterasyon=1;

enIyiDeger= 1000000;

while( (iterasyon < iterasyonSayisi) && (enIyiDeger > kabulSiniri))

    obj=zeros(populasyonBoyutu,1);
    for i=1:populasyonBoyutu
        % amac fonksiyonu 
        % burada amac (X1^2 + X2^2 + ..+ Xboyut^2 = 0) denklemini saglayan en iyi X
        % degerlerini bulmaktir
        % obj(i)=sum(populasyon(i,:).^2*(-1)^i); 
         obj(i)=sum(populasyon(i,:).^2); 
    end

    
    if(min(obj) < enIyiDeger)
        enIyiDeger=min(obj);
        idx=find(obj==enIyiDeger);
        enIyiCozum=populasyon(idx,:);
    end
    objIt(iterasyon)=enIyiDeger;
    arapop = dogalSecilim(populasyon, obj, populasyonBoyutu);
    arapop = caprazlama(arapop, populasyonBoyutu, caprazlamaOrani, boyut);
    populasyon = mutasyon(arapop,degisimOrani, populasyonBoyutu, boyut,degisimYuzdesi, alt_sinir, ust_sinir);
    iterasyon=iterasyon+1;
end
plot(objIt); hold on;
end



