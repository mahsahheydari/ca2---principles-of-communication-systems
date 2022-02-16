for c=1:5
    t=-1:1/600:1;
    m2=sinc(10*t).*(heaviside(t)-heaviside(t-1))+heaviside(-t)*0;
    
    AC=1;
     prompt2 = 'What is the freq? ';
    FC=input(prompt2)
    DSB=@(AC,m2,FC)((AC.*m2).*cos(2*pi*FC*t));
    xc2=DSB(AC,m2,FC);
    plot(t,double(xc2),t,m2)
    title("inputed freq is " + FC+ " fc")
    xlabel("time(sec)")
    ylabel("xc(t)")
    if FC==100
    subplot(211),plot(t,double(xc2),t,m2)
    title("inputed freq is " + FC+ " Hz")
    xlabel("time(sec)")
    ylabel("xc(t)")
    
    M=fft(xc2);
    mf=fftshift(M);
    f=fftshift(t);
    subplot(212),plot(t,abs(mf))
    xlabel("frequency(Hz)")
    ylabel("Xc(f=100Hz)")

    end
end