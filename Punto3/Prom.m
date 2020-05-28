%Juan Felipe Peña 2175507-Juan Manuel Becerra 2175775-Jose Lopez
%2175425-Juan Camilo Guzman 2175559
%Sacamos la señal promedio de cada palabra
hold on
suma=0;
for k=1:10
    load(strcat('der', num2str(k),'.mat'));
    suma=suma+absH;
end
derprom=suma/10;
hold off
figure
plot(derprom)

save('derF','derprom')
