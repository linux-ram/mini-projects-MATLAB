%script to simulate sequentially flipping a coin nToss times. 
%plot the running estimate of the probability of getting ‘heads’ with this coin.
nToss=5000;
coin_tosses=round(rand(1,nToss));
Y=cumsum(coin_tosses);
sample_probability=Y./(1:nToss);
plot((1:nToss),sample_probability,'k',(1:nToss),0.5*ones(1,nToss),'r')

xlabel('Number of coin flips')
ylabel('Probability of heads')
title('Sample Probability of Heads in n flips of a simulated coin')
legend('Sample Probability', 'Fair coin')
axis([1 nToss 0 0.8])