function [surudekiEnIyiBireyinYeri suruEnIyiDegeri objIt] = pso3(altSinir, ustSinir, bireySayisi, problemBoyutu, iterasyonSayisi, genelHizKatsayisi, bireyselHizKatsayisi, suruHizKatsayisi )

% Hazirlayan: Ismail Kirbas
% Tarih: 8 Ekim 2017

% Kaynak:
% https://www.youtube.com/watch?v=eVLON73HpUM&index=1&list=PLUD51ympCn_Jg--0z3Cd83jZ27ja8-Jqq
% (Ayca Altay)

% Varsayilan degerler

% altSinir             =-10
% ustSinir             =10
% bireyselHizKatsayisi =2
% suruHizKatsayisi     =2
% genelHizKatsayisi    =0.8
% bireySayisi          =50
% problemBoyutu        =4
% iterasyonSayisi      =50

clc;
disp('Orijinal suru');
suru =unifrnd(altSinir,ustSinir,[bireySayisi problemBoyutu])
obj  =zeros(bireySayisi,1);

for i=1:bireySayisi
    obj(i)=sum(suru(i,:).^2);
end

disp('Orijinal obj');
oobj=obj

hiz=zeros(bireySayisi,problemBoyutu);
bireyselEnIyiPozisyon=suru;
bireyselEnIyiDeger=obj;

% surunun en iyi değeri
suruEnIyiDegeri=min(obj);
idx=find(suruEnIyiDegeri==obj);
surudekiEnIyiBireyinYeri=suru(idx,:);

objIt(1)=suruEnIyiDegeri;

iterasyon=1;

while(iterasyon <= iterasyonSayisi)
    
    
    for i=1:bireySayisi
        hiz(i,:) = genelHizKatsayisi * hiz(i,:) + bireyselHizKatsayisi * unifrnd(0,1) * (bireyselEnIyiPozisyon(i,:)- suru(i,:));
        hiz(i,:) = hiz(i,:)                     + suruHizKatsayisi     * unifrnd(0,1) * (surudekiEnIyiBireyinYeri - suru(i,:));
    end
    
    enYuksekHizDegeri=(ustSinir-altSinir)/2;
    
    for i=1:bireySayisi
        for j=1:problemBoyutu
            if (hiz(i,j)>enYuksekHizDegeri)
                hiz(i,j)=enYuksekHizDegeri;
            end
            if (hiz(i,j)< -enYuksekHizDegeri)
                hiz(i,j)= -enYuksekHizDegeri;
            end
        end
    end
    
    % pozisyonlari guncelle
    suru=suru + hiz;
    
    % limitleri aşan eleman varsa limit sinirlarina cek
    for i=1:bireySayisi
        for j=1:problemBoyutu
            if (suru(i,j)> ustSinir)
                suru(i,j)= ustSinir;
            elseif (suru(i,j) < altSinir)
                suru(i,j)= altSinir;
            end
        end
    end
    
    
    % obj fonksiyonu yeniden hesaplaniyor
    for i=1:bireySayisi
        obj(i)=sum(suru(i,:).^2);
    end
      
    
    % parcacik en iyisini guncelle
    
    for i=1:bireySayisi
        if (obj(i) < bireyselEnIyiDeger(i))
            bireyselEnIyiDeger(i) = obj(i);
            bireyselEnIyiPozisyon(i,:) = suru(i,:);
        end
    end
    
    % surunun en iyisini guncelle
    if (min(obj) < suruEnIyiDegeri)
        suruEnIyiDegeri= min(obj);
        idx=find(suruEnIyiDegeri==obj);
        surudekiEnIyiBireyinYeri=suru(idx,:);
    end
    
    iterasyon=iterasyon+1;
    
    objIt(iterasyon)=suruEnIyiDegeri;
    
end % while

plot(objIt); hold on;
end

