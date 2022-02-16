function [z,y]=dem1(xc2,fc,Ac,fs) 
clc
% fc=50;
fs=600;
t=0:1/600:1-1/600;
y=2*Ac.*cos(2*pi*fc*t).*xc2;

z=lowpass(y,200,600);

end