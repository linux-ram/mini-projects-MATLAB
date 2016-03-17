%pendulum_main

[t,x]=ode45('pendulum',[0 10],[0.9*pi 0]);
%assume pendulum is almost horizontal
plot(t,x(:,1));
hold on;
plot(t,x(:,2),'r');
legend('Position','Velocity');

figure;
plot(x(:,1),x(:,2));
xlabel('Position');
ylabel('Velocity');