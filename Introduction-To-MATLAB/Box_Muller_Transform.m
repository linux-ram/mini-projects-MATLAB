N = 20000; X = sqrt(-log(rand(1,N))).* cos(2*pi*rand(1,N));
Y=sqrt(-log(rand(1,N))).*sin(2*pi*rand(1,N));
plot(X,Y,'r.')
axis tight