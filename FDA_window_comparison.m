clc; clear; close all;
% Find the folder of the signal data
folder = 'C:\Users\wenhanzhang\Desktop\space micro\space micro';

% Read the data structure from .dat documents
WiFi = readdata(folder, 'WiFi1.mat');
LTE = readdata(folder, 'LTE1.mat');
FiveG = readdata(folder, '5GNR1.mat');

% Get the waveform from structure
WiFi_waveform = WiFi.waveStruct.waveform;
LTE_waveform = LTE.waveStruct.waveform(:,1);
FiveG_waveform = FiveG.waveStruct.waveform;

% Get the normalized real, imaginary, and absolute part of the generated siganls
[WiFi_waveform_real, WiFi_waveform_imag, WiFi_waveform_abs] = getRealImagAbs(WiFi_waveform);
[LTE_waveform_real, LTE_waveform_imag, LTE_waveform_abs] = getRealImagAbs(LTE_waveform);
[FiveG_waveform_real, FiveG_waveform_imag, FiveG_waveform_abs] = getRealImagAbs(FiveG_waveform);

% Preview the I/Q samples distribution
plotThree('WiFi', WiFi_waveform_real, WiFi_waveform_imag, WiFi_waveform_abs)
plotThree('LTE', LTE_waveform_real, LTE_waveform_imag, LTE_waveform_abs)
plotThree('5G NR', FiveG_waveform_real, FiveG_waveform_imag, FiveG_waveform_abs)

% Get equal-length I/Q samples for the analysis
% Discard the empty parts in the generated siganl
WiFi_seg = WiFi_waveform(1:25000);
LTE_seg = LTE_waveform(1:25000);
FiveG_seg = FiveG_waveform(10001:35000);

% Get the normalized real, imaginary, and absolute part of the siganl segments 
[WiFi_seg_real, WiFi_seg_imag, WiFi_seg_abs] = getRealImagAbs(WiFi_seg);
[LTE_seg_real, LTE_seg_imag, LTE_seg_abs] = getRealImagAbs(LTE_seg);
[FiveG_seg_real, FiveG_seg_imag, FiveG_seg_abs] = getRealImagAbs(FiveG_seg);

% Check the I/Q equal-length samples distribution
plotThree('WiFi', WiFi_seg_real, WiFi_seg_imag, WiFi_seg_abs)
plotThree('LTE', LTE_seg_real, LTE_seg_imag, LTE_seg_abs)
plotThree('5G NR', FiveG_seg_real, FiveG_seg_imag, FiveG_seg_abs)

% First attempt to apply short time Fourier Transform
figure
spectrogram(WiFi_seg_real);
figure
spectrogram(LTE_seg_real);
figure
spectrogram(FiveG_seg_real);
% Second attempt to apply short time Fourier Transform
spectroPlot(WiFi_seg_real);
spectroPlot(LTE_seg_real);
spectroPlot(FiveG_seg_real);
% Second attempt increase the signal difference 

% Applying a moving window to segment the long sequece into short ones
WiFi_segs = seg(WiFi_seg_real, 500);
LTE_segs = seg(LTE_seg_real, 500);
FiveG_segs = seg(FiveG_seg_real, 500);

% Applying short time Fourier Transform to segmented sequences in the
% segments matrix



