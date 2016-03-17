function juliaAnimation(zMax,c,N)

temp=linspace(-zMax,zMax,500);
[R,I]=meshgrid(temp,temp);
Z=R+1i*I;
M=N*ones(size(Z));

for n=2:N+1
    Z=Z.^2+c*ones(size(Z));
    [x_index,y_index]=find(abs(Z)>2);
    Z(x_index,y_index)=NaN;
    M(x_index,y_index)=n;
    imagesc(temp,temp,atan(0.1*M));
    axis xy;
    drawnow;
end

