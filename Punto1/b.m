%Juan Felipe Peña 2175507-Juan Manuel Becerra 2175775-Jose Lopez
%2175425-Juan Camilo Guzman 2175559
%Creamos un señal triangular:la graficamos y la reproducimos a dos
%frecuencias 210hz y 420hz
% 1.B.II Graficar 
  x_t=0; 
  t=[-2:1/100:2];
  for k=-19:2:19
     x_t=x_t + (2*(2-(2*(-1^k)))/(2*(pi^2)*(k^2)))*exp(1i*k*(2*pi)*t); 
  end
  plot(t,x_t)
  
% 1.B.III Sonar a 210hz
  x_t=0; 
  fs=8000;
  t=[0:1:2*fs];
  fo=210;
  c_k=0;
  for k=1:2:19
     c_k(k)=(2*(2-(2*(-1^k)))/(2*(pi^2)*(k^2)));
     x_t=x_t + c_k(k) *exp(1i*k*((2*pi*fo)/fs)*t);
  end
  plot(t,x_t)
  soundsc(real(x_t),fs)
% 1.A.IV Sonar a 420hz
x_t=0; 
  fs=8000;
  t=[0:1:2*fs];
  fo=420;
  c_k=0;
  for k=1:2:19
     c_k(k)=(2*(2-(2*(-1^k)))/(2*(pi^2)*(k^2)));
     x_t=x_t + c_k(k) *exp(1i*k*((2*pi*fo)/fs)*t);
  end
  plot(t,x_t)
  soundsc(real(x_t),fs)