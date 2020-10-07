%% Open files and read the data
clc; clear; close all;
% Find the folder of the signal data
folder = 'C:\Users\wenhanzhang\MATLAB\Projects\FDA_window_comparison';

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

%% Remove the redundant data according to three types of data waveform length
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

%% Spectrum analysis
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
writematrix(WiFi_segs,'WiFi_segs.csv')
writematrix(LTE_segs,'LTE_segs.csv')
writematrix(FiveG_segs,'FiveG_segs.csv')


%% Use the return value p for the waterfall and spectrogram
% Test for pspectrum function
[p,f,t] = pspectrum(WiFi_seg_real,'spectrogram');
[p2,f2,pwr] = pspectrum(WiFi_seg_real,'persistence');
figure
plot(p,f)
plog = 10*log10(p);
waterfall(f,t,plog');
wtf = gca;
wtf.XDir = 'reverse';
view([30 45])

p2log = 10*log10(p2);
figure
plot(p2log)
p3 = pspectrum(WiFi_seg_real);
p3log = 10*log10(p3);
figure
plot(p3log)
pspectrum(WiFi_seg_real,'spectrogram');
s = size(plog);
[x,z] = ndgrid(1:s(1),1:s(2));
plot3(x,plog,z);

%%
% Applying short time Fourier Transform to segmented sequences
%for i 

% segments matrix



