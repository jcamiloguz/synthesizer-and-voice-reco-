## figure;
## t=[0:1/100:1];
## x_t=0;
## hold on
## for k=1:33
##   if (mod(k,2)==0) 
##   else
##     if (mod(k,4)==1)
##       x_t=x_t+((4/pi)*e.^(i*k*((2*pi)*210/8000)*t)); 
##     else
##       x_t=x_t+((-4/pi)*e.^(i*k*((2*pi)*210/8000)*t)); 
##     end  
##   end
##   plot(t,x_t)
##    
##    
## endfor
## x_t=+x_t;


 t=[0:1/100:1];
 x_t=0;
 hold on
 for k=1:33
   if (mod(k,2)==0) 
   else
     if (mod(k,4)==1)
       x_t=x_t+((4/pi)*e.^(i*k*((2*pi)*210/8000)*t)); 
     else
       x_t=x_t+((-4/pi)*e.^(i*k*((2*pi)*210/8000)*t)); 
     end  
   end
   plot(t,x_t)
    
    
 endfor
 x_t=+x_t;
