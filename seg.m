function segments = seg(sequence, L)
% Use the input sequence and defined length to segment the long sequence
% into short ones. The return value is a 2-D matrix. Each row element is
% the equal-length segments
%num = floor(length(sequence)/ L);
num = length(sequence) - L;
segments = zeros(num, L);
for i = 1: num
    segments(i,:) = sequence(i:i+L-1);
end


