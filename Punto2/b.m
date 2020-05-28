fs=8000;
doce= 440*2.^((0:12)/12);
Amayor=doce([1 3 5 6 8 10 12 13]);
notas=Amayor([ 3 2 1 2 3 3 3 2 2 2 3 5 5 3 2 1 2 3 3 3 2 2 3 2 1]);
duraciones = [0.5 0.5 0.5 0.5 0.5 0.5 1.0 0.5 0.5 1.0 0.5 0.5 1.0 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 2.0];
x_t=0;
y=0;
m=4;

  for n=1:1:length(duraciones)
    g=duraciones(1)*fs
    t=[0:1:g];
    x_t=0;

  for k=1:2:33
    m=m*-1;
     x_t=x_t + (m/(2*pi*k))*exp(1i*k*((2*pi*notas(n))/(fs))*t);
  end
  y=[y x_t];
  end
  sound(real(y),fs);