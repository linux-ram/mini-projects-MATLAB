clear all; close all; clc
set(0, 'DefaultAxesFontSize', 20);

% Record your voice for 5 seconds.
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
figure(1)
plot(myRecording);
title('Your Speech Signal','interpreter','latex','FontSize',25,'FontWeight','bold')
xlabel('Sample Index','FontSize',19,'FontWeight','bold')
ylabel('Amplitude (Double-Precision)','FontSize',19,'FontWeight','bold')
figure(2)
spectrogram(myRecording,8e3,'yaxis');
title('Spectrogram of your Recording','interpreter','latex','FontSize',25,'FontWeight','bold')
xlabel('Time','FontSize',19,'FontWeight','bold')

%%
%%%%%% play the recorded vowel %%%%%%%%
uiwait(msgbox('Hit OK to play the vowel','Title','modal'));
% Play back the recording.
play(recObj);