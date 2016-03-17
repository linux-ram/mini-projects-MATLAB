function M=julia(zMax,c,N)

M_size=500;
Z1=linspace(-zMax,zMax,M_size);
[Real,Imag]=meshgrid(Z1,Z1);
Z=Real+1i*Imag;

M=zeros(size(Z));

for row=1:M_size
    for column=1:M_size
        M(row,column)=escapeVelocity(Z(row,column),c,N);
    end
end

imagesc(atan(0.1*M));
axis xy