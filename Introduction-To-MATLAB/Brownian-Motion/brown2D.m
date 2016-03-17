function brown2D(N)

nIter=1000;
x=zeros(1,N);
y=zeros(1,N);

for i=1:nIter
    x=x+0.005*randn(1,N);
    y=y+0.005*randn(1,N);
    plot(x,y,'k.')
    axis([-1 1 -1 1])
    pause(0.01)
end

