clear all; close all; clc
set(0, 'DefaultAxesFontSize', 20);

%% Load `aah`: Near Open Vowel
filename='NearOpenVowel.wav';
[A, Fs]=audioread(filename);
AudInfo=audioinfo(filename);

% #Samples=25173
fprintf(['#Samples=' num2str(AudInfo.TotalSamples)]);
% #bits/sample=16
fprintf(['\n#bits/sample=' num2str(AudInfo.BitsPerSample)]);
% Sampling Rate=22050
fprintf(['\nSampling Rate=' num2str(Fs) '\n']);

%%
figure(1)
Cropped_A=A(1814:18290);
plot(Cropped_A)
title('Near Open Vowel - \bf{aah}','interpreter','latex','FontSize',25,'FontWeight','bold')
xlabel('Sample Index','FontSize',19,'FontWeight','bold')
ylabel('Amplitude','FontSize',19,'FontWeight','bold')
axis tight

%%
figure(2)
% DFT_Size = #Samples
b=abs(fft(A));
plot(b(1:round(0.5*size(b,1))))
title('Single Sided Spectrum of \bf{aah}','interpreter','latex','FontSize',25,'FontWeight','bold')
xlabel('Index','FontSize',19,'FontWeight','bold')
ylabel('Amplitude','FontSize',19,'FontWeight','bold')

%%
%%%%%% play the recorded vowel %%%%%%%%
uiwait(msgbox('Hit OK to play the vowel','Title','modal'));
sound(Cropped_A,Fs)
