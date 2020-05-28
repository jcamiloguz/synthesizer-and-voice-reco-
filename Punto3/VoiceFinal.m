%Juan Felipe Peña 2175507-Juan Manuel Becerra 2175775-Jose Lopez
%2175425-Juan Camilo Guzman 2175559
close all
clear all
clearvars

%Tomamos la señales de referencia 
load(strcat('izqF.mat'));
load(strcat('derf.mat'));
load(strcat('salf.mat'));
hold on
plot(salprom,'red')
plot(izqprom,'yellow')
plot(derprom)
title('Señales de referencia')
hold off

%Grabamos y filtramos 
Fs = 8000; 
t=[1:(2*Fs)];
y = audiorecorder(Fs, 8, 1);
recordblocking(y,2)
x=getaudiodata(y);
N    = 180   ;   
Fc1  = 100;    
Fc2  = 1600 ;   
flag = 'scale';
win = hamming(N+1);

banda  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);%Coeficientes del filtro
F=dfilt.dffir(banda);%se crea el filtro
xF=filter(F,x);%se filtra la señal
xfg=xF/(max(abs(xF)));
fouX=fft(xfg);%se realiza el fft
fouX(1)=fouX(1)/(Fs*2);
fouX(2:end)=fouX(2:end)/((Fs*2)*2);
fouX=fouX.^2;%feature
signal=fouX(1:length(fouX)/2);%se toma un lado de la fft
plot(abs(signal),'yellow')
%Sacamos la diferencia entre la fft^2 de la grabacion y la fft^2 de cada
%palabra
Fizq=abs(izqprom)-abs(signal);
Fder=abs(derprom)-abs(signal);
Fsal=abs(salprom)-abs(signal);
%Hallamos la distancia euclidiana de la diferencia
disiz=norm(Fizq)
disder=norm(Fder)
dissal=norm(Fsal)
%Condiciones: la distancia menor encontrada sera nuestra palabra :D
if((disiz<disder) && (disiz<dissal))
    disp('Izquierda')
end
if((disder<disiz) && (disder<dissal))
   disp('derecha')
end
if((dissal<disiz) && (dissal<disder))
    disp('saltar')
end

sound(xF,Fs)
