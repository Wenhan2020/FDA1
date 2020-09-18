function [r,i,a]= getRealImagAbs(waveform)
% This function is used to get the real part, imaginary part, and the
% absolute value of the I/Q sequences from the collected waveforms. Then
% normalize the data for each part for further analysis
r = real(waveform);
r = normalize(r,'range');
i = imag(waveform);
i = normalize(i,'range');
a = abs(waveform);
a = normalize(a,'range');
