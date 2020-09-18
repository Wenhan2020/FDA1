function []= spectroPlot(segs)
% This function uses the sequences as input, and calculates the power
% spectra and the spectrogram of the received signals
figure
subplot(2,1,1)
pspectrum(segs);
subplot(2,1,2)
pspectrum(segs,'spectrogram');