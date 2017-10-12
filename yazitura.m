clc;
atisAdedi=1000;
turasayisi=0;
yazisayisi=0;
birAdedi=0;
ikiAdedi=0;
ucAdedi=0;
dortAdedi=0;
besAdedi=0;
altiAdedi=0;
for i=1:atisAdedi
    atis=rand(1);
    zar=randi(6);
    fprintf('Zar=%d \n',zar);
    if (zar==1) 
        birAdedi=birAdedi+1;
    end
    if (zar==2) 
        ikiAdedi=ikiAdedi+1;
    end
    if (zar==3) 
        ucAdedi=ucAdedi+1;
    end
    if (zar==4) 
        dortAdedi=dortAdedi+1;
    end
    if (zar==5) 
        besAdedi=besAdedi+1;
    end
    if (zar==6) 
        altiAdedi=altiAdedi+1;
    end
    
    if (atis<=0.49999)
        disp('Tura')
        turasayisi=turasayisi+1;
    else
        disp('Yazi')
        yazisayisi=yazisayisi+1;
    end
end
fprintf('Tura sayýsý=%d\n',turasayisi);
fprintf('Yazý sayýsý=%d\n',yazisayisi);
fprintf('1=%d 2=%d 3=%d 4=%d 5=%d 6=%d\n',birAdedi,ikiAdedi,ucAdedi,dortAdedi,besAdedi,altiAdedi);