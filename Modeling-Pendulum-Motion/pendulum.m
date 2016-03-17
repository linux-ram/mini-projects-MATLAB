function dxdt = pendulum(t,x)
L=1;
theta=x(1);
gamma=x(2);

dtheta=gamma;
dgamma=-(9.8/L)*sin(theta);

dxdt=zeros(2,1); %note: column vector

dxdt(1)=dtheta;
dxdt(2)=dgamma;
