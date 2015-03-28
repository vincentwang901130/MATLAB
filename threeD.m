time=[0:999]*0.001;
% Create the in-phase (I) signal at frequency f
f=3; % Hz 
Isignal=cos(2*pi*f*time);
% Create the quadrature (Q) signal
Qsignal=sin(2*pi*f*time);
plot3(Isignal,Qsignal,time);
% Annotations
grid on;
xlabel('Isignal');
ylabel('Qsignal');
zlabel('Time');