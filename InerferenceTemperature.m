% Interference Temperature Example
% Version: March 8, 2015
% Boltzmann constant 
k=1.3806488 * 10^(-23);
% Interference Temperatures (dBK)
TdBK=[84 88 86];
% Corresponding bandwidths (in hertz)
BW=[250 500 250]*1000;
% Convert temperature to linear form (Kelvin)
T=10.^(TdBK./10);
% RSS in dBm form
RSSdBm= -50;
% Convert RSS to linear form (in Watts)
RSS=10^(RSSdBm/10)*1000;
%%% Determine interference power (in Watts)
I=k*T.*BW;
%%% Calculate corresponding SNRs
SNR=RSS./I;
%% Apply Shannon's equation to determine capacity
C=0;
for i=1:length(T)
    C=C+BW(i)*log2(1+SNR(i));
end
fprintf('Capacity is %.2f bps\n', C);