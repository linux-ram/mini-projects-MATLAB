%generate quadratic Julia Sets
function n=escapeVelocity(z0,c,N)
z=zeros(1,N);
z(1)=z0;
label=0;

for k=1:N+1    
    if abs(z(k))>2
        n=k;
        label=1;
    end
    z(k+1)=(z(k))^2+c;
end

if label==0
    n=N;
end