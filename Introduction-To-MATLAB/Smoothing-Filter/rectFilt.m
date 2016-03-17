function smoothed=rectFilt(x,width)

%Input: noisy densely sampled x
%Output: smoothed version of x by doing a symmetric moving average with a window of the specified width
%length(x)=length(smoothed)

smoothed=[];
if rem(width,2)==0
    width=width+1;
    disp('width has to be odd!')
end

%dealing with edge effect at the start of x
for n=1:0.5*(width+1)-1
    smoothed(n)=mean(x(1:n));
end

for n=0.5*(width+1):length(x)-0.5*(width-1)
    smoothed(n) = mean(x(n-0.5*(width-1):n+0.5*(width-1)));
end

%dealing with edge effect at the end of x
for n=length(x)-0.5*(width-1)+1:length(x)
    smoothed(n)=mean(x(length(x)-0.5*(width-1)+1:n));
end

plot(x,'b.');
hold on
plot(smoothed,'r')
xlabel('Index')
ylabel('Data Value')
title('Smoothing Illustration')
legend('Original data','Smoothed')