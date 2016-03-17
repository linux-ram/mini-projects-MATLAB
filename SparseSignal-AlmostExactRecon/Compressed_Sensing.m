% Almost Exact Reconstruction of Sparse Signals from Pseudo-Random Samples
% "L1 magic" software by Justin Romberg is used to solve the nonlinear optimization problem: min_x ||x||_1  s.t.  Ax = b
% URL: http://www.acm.caltech.edu/l1magic 

% f = signal = sum of three sinusoids
% b = pseudo-random samples of f

clc; clear all; close all;
set(0,'DefaultAxesFontSize',16);

Fs = 40000;
t = (1:Fs/8)'/Fs;
f = (sin(2*pi*697*t) + sin(2*pi*941*t) + sin(2*pi*1633*t))/3; % 697Hz, 941Hz and 1633Hz
% f = (sin(2*pi*697*t) + sin(2*pi*941*t) + sin(2*pi*1633*t))/3 + 0.05.*randn(length(t),1); 
% 697Hz, 941Hz, 1633Hz and normally distributed noise with mean 0 and standard deviation 0.05

n = length(f); % n = length(t); n = Fs/8
m = ceil(n/10); % m<<n; #measurements<<#samples
k = randperm(n)'; % k is the pseudo-random permutation of positive integers from 1 to n
k = sort(k(1:m)); % k is the sorted m pseudo-random samples of positive integers from 1 to n
b = f(k); % b is the pseudo-random samples of f
disp(['Number of significant frequency components in f = K = ' num2str(sum(abs(dct(f))>=sqrt(mean(dct(f).*dct(f)))))...
    ' << Number of measurements = M = ' num2str(m) ' << Number of samples = N = ' num2str(n)])
% Theory of compressed sensing requires K << M << N; M ~ K*log(N/K)

str=sprintf('\n\n');
disp(str) % to print newline twice

% Plot f and b
% Plot dct(f) = discrete cosine transform
% dct uses only real arithmetic operations 

f_axis = [0 max(t)/4 -1.2 1.2];
d_axis = [0 n/8 -10 10];
figure;
subplot(2,1,1)
plot(t,f,'b-',t(k),b,'k.')
axis(f_axis);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('f = signal, b = pseudo-random samples of f','FontSize',25,'FontWeight','bold')
subplot(2,1,2)
plot(dct(f))
axis(d_axis);
set(gca,'xtick',0:100:600)
title('c = dct(f)','FontSize',25,'FontWeight','bold')

% A = rows of IDCT matrix with indices of random sample

D=idct(eye(n));
A=D(k,:); % A is rectangular and hence we achieve compression

% y is the l2 solution to A*y = b

y = pinv(A)*b;

% x is the l1 solution to A*x = b
% 'L1 magic' is invoked

x = l1eq_pd(y,A,A',b,5e-3,32); % type 'help l1eq_pd' on the command window for more info

% Plot x and idct(x)
% idct(x) compares good with f

figure
subplot(2,1,1)
plot(t,idct(x))
axis(f_axis);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('idct(x)','FontSize',25,'FontWeight','bold')
subplot(2,1,2)
plot(x)
axis(d_axis);
set(gca,'xtick',0:100:600)
title('x = {\it l}_1 solution, A*x = b ','FontSize',25,'FontWeight','bold')

% Plot y and idct(y)
% idct(y) poorly compares with f

figure
subplot(2,1,1)
plot(t,idct(y))
axis(f_axis);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('idct(y)','FontSize',25,'FontWeight','bold')
subplot(2,1,2)
plot(y)
axis(d_axis);
set(gca,'xtick',0:100:600)
title('y = {\it l}_2 solution, A*y = b ','FontSize',25,'FontWeight','bold')

% f and the reconstructed signal
% It is surprising that the reconstructed signal resembles f closely!
% It should be kept in mind that f is almost exactly reconstructed from just M (<<N) pseudo-random samples of f

figure
subplot(2,1,1)
plot(t,idct(x))
axis(f_axis);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
    'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('Reconstructed Signal','FontSize',25,'FontWeight','bold')
subplot(2,1,2)
plot(t,f)
axis(f_axis);
set(gca,'xtick',.005:.005:.030,'ytick',-1:1, ...
   'xticklabel',{'.005','.010','.015','.020','.025','.030'})
title('f','FontSize',25,'FontWeight','bold')

% input('Press any key to continue')
str=sprintf('\n\n');
disp(str) % to print newline twice

disp(['The l0 norm of c and x and y are ' num2str(sum(dct(f)~=0)) ' and ' num2str(sum(x~=0)) ' and ' num2str(sum(y~=0)) ' respectively.']) 
% This definition of l0 'norm' is loose. It can be defined as sum(abs(x)>=0.1) because then it is gives a better picture of what is happening.
% In that case the output is "The l0 norm of c and x and y are 366 and 237 and 2058 respectively."
disp(['The l1 norm of c and x and y are ' num2str(sum(abs(dct(f)))) ' and ' num2str(sum(abs(x))) ' and ' num2str(sum(abs(y))) ' respectively.'])
disp(['The l2 norm of c and x and y are ' num2str(sqrt(sum(dct(f).^2))) ' and ' num2str(sqrt(sum(x.^2))) ' and ' num2str(sqrt(sum(y.^2))) ' respectively.'])

str=sprintf('\n\n');
disp(str) % to print newline twice

% Play the three sounds
input('Press any key to play f')
sound(f,Fs)
input('Press any key to play idct(x) - Notice how it sounds similar to f')
sound(idct(x),Fs)
input('Press any key to play idct(y)')
sound(idct(y),Fs)

str=sprintf('\n\n');
disp(str) % to print newline twice

disp('End of Code Demo!')
