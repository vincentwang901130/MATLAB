% Generator of an in-phase signal and its quadrature
% --------------------------------------------------
% Create an array of 1000 time instants, in steps of 0.001 s.
time=[0:999]*0.001;
% Create the in-phase (I) signal at frequency f
f=2; % Hz 
Isignal=cos(2*pi*f*time);
% Create the quadrature (Q) signal
Qsignal=cos(2*pi*f*time-pi/2);
% Plot the signals
plot(time, Isignal,':r');
hold on;
plot(time, Qsignal,'--b');
% Annotations
grid on;
title('I (..) and Q (--) Signals');
xlabel('Time (s)');
ylabel('Amplitude (V)');