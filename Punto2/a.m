doce= 440*2.^((0:12)/12);
Amayor=doce([1 3 5 6 8 10 12 13])
notas=[ 3 2 1 2 3 3 3 2 2 2 3 5 5 3 2 1 2 3 3 3 2 2 3 2 1];
y=0;
  for n=1:1:25
  x_t=0; 
  fs=8000;
  t=[0:1:0.5*fs];
  fo=Amayor(notas(n));
  c_k=0;
  for k=1:2:33
     c_k(k)=(2/(pi*k))*((-1)^((k-1)/2));
     x_t=x_t + c_k(k) *exp(1i*k*((2*pi*fo)/fs)*t);
  end
  y=[y x_t];
  end
  sound(real(y),fs)