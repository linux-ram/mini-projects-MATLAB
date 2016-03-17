%Fit first, second, third, fourth, and fifth degree polynomials to randomData
%Use the centering and scaling version of polyfit (the one that returns
%three arguments, see help) and its counterpart in polyval (the one that accepts
%the centering and scaling parameters)

%randomData contains variables x and y
load randomData.mat

%plot the data
plot(x,y,'k.');
hold on

%fit the polynomial and plot it
%use the centering and scaling version of polyfit (the one that returns three arguments, see help)
%and its counterpart in polyval (the one that accepts the centering and scaling parameters)
Color={'b','c','g','y','r'};
for N=1:5;
[P,S,MU] = polyfit(x,y,N);
y_fit=polyval(P,(x-MU(1))/MU(2));
plot(x,y_fit,Color{N})
end

xlabel('X')
ylabel('Y')
title('polynomial fits to noisy data')
legend('Data','Order 1','Order 2','Order 3','Order 4','Order 5','Location','best')