function [] = plotThree (name,waveform_real, waveform_imag, waveform_abs)
% This function is used to visualize the waveform from I/Q samples
figure
subplot(3,1,1)
plot(waveform_real)
title(name)
ylabel('Amlitude','FontSize',10);
subplot(3,1,2)
plot(waveform_imag)
ylabel('Amlitude','FontSize',10);
subplot(3,1,3)
plot(waveform_abs)
ylabel('Amlitude','FontSize',10);
xlabel('Samples')

