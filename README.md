"# Genetik Algoritmalar için Örnek Matlab Kodlari" 

Hazirlayan: Ismail KIRBAS   Tarih: 7 Ekim 2017

Fonksiyonu test etmek icin asagidaki satiri Matlab komut satirina yazmaniz yeterlidir.  

[ objIt, enIyiDeger, enIyiCozum ] = ga( -1, 1, 4, 40, 0.95, 0.02, 0.09, 100, 0.005 )  

Dikkat: Ayni dizin icerisinde  "caprazlama.m", "dogalSecilim.m" ve "mutasyon.m" dosyalarının yer almasi gerekir.  

Ornek calisma parametreleri  

alt_sinir=-1  
ust_sinir=-1  
boyut=4  
populasyonBoyutu=40  
caprazlamaOrani=0.95  
degisimOrani=0.02 (mutasyon)  
degisimYuzdesi=0.09 (delta)  
iterasyonSayisi=100  
kabulSiniri=0.005  
