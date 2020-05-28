%Juan Felipe Peña 2175507-Juan Manuel Becerra 2175775-Jose Lopez
%2175425-Juan Camilo Guzman 2175559
%Grabamos 2 seg y creamos los dos filtros:Pasa banda y pasa bajas, nos decidos por el pasa
%banda y se cuarda el audio unilateral de la fft^2.
close all
Fs = 8000 
t=[1:(2*Fs)];
y = audiorecorder(Fs, 8, 1);
recordblocking(y,2)
x=getaudiodata(y);

N    = 180      % Order
Fc1  = 100     % First Cutoff Frequency
Fc2  = 1600    % Second Cutoff Frequency
flag = 'scale'  % Sampling Flag
win = hamming(N+1)

% Calculate the coefficients using the FIR1 function.
banda  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);
baja  = fir1(N, Fc2/(Fs/2), 'low', win, flag);
F=dfilt.dffir(banda);
F2=dfilt.dffir(baja);

xF=filter(F,x);
xF2=filter(F2,x);
%reproduce audio crudo
sound(x,Fs)
pause(2)
%reproduce audio filtrado pasabanda
sound(xF,Fs)
pause(2)
%reproduce audio filtrado pasabanda
sound(xF2,Fs)
figure
xfg=xF/(max(abs(xF)));
plot(t,xfg)
title('PASA BANDA');
figure
xfg2=xF2/(max(abs(xF2)));
 
title('PASA BAJA');
fouX=fft(xfg);
figure
plot(abs(fouX))
title('FFT');

fouX(1)=fouX(1)/(Fs*2);
fouX(2:end)=fouX(2:end)/((Fs*2)*2);
fouX=fouX.^2;
f=[1:Fs];
figure
half=fouX(1:length(fouX)/2);
plot(f,abs(half))
title('FFT ^2');
absH=abs(half);
%save('','absH') lo usamospara guardar los archivos