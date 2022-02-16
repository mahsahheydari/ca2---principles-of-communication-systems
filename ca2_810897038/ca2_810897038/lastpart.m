index=0;
t=0:1/600:1-1/600;
    m2=sinc(10*t).*(heaviside(t)-heaviside(t-1))+heaviside(-t)*0;
    Ac=1;
    fc=100;
    fs=600;
    DSB=@(Ac,m2,fc)((Ac.*m2).*cos(2*pi*fc*t));
    xc2=DSB(Ac,m2,fc);
for fc=-500:10:500 
index=index+1;
xc=DSB(Ac,m2,fc);
[zt,yt]=dem(xc,fc,Ac);
data(index)=immse(zt,m2) ;  
end

fc=-500:10:500
plot(fc,data)