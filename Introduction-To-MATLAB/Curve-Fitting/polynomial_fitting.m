x=-4:0.1:4;
y=x.^2;
%Add random noise to these samples. Use randn. Plot the noisy signal with .markers
y=y+randn(size(y));
plot(x,y,'.');
%Fit a 2nd degree polynomial to the noisy data
p=polyfit(x,y,2);
%Plot the fitted polynomial on the same plot, using the same x values and a red line
hold on;
plot(x,polyval(p,x),'r')