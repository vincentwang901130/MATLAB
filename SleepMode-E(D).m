% Sleep mode protocol simulation in Matlab(For caculating E(D))
% Original Author: Pro. Michel Barbeau, Carleton University
% Modified By: Wenqian Wang, Carleton University
% Version: March 28, 2015
%%% Common parameters
%%
L = 1; % lenght of a listing interval
Tmin = 1; % minimum listening time
Tmax = 1024; % maximum listening time
m = log2(Tmax/Tmin);
%%% Analytic model
%%
% derived constant "p"
p = @(lambda)(exp(-lambda*(Tmax + L))); 
% probability distribution funtion of "n"
Pr_n_i = @(lambda, i)... % for 1<=i and i<=m
    (exp(-lambda*(Tmin*(2^i-1) + i*L) ) * (1 - exp(-lambda*(Tmin*(2^i-1) + L))));
% Calculation of the expected value of "n"
lambdas = 0.02:0.02:0.2; % calculations are done for 10 different values of lambda
ED = zeros(1,length(lambdas)); % expected values of "n", for each value of lambda, init to zero
for k = 1:length(lambdas)
    % compute E[ n ] for lambdas(k)
    for i = 0:m
        for j=0:i
        ED(k) = ED(k) + Pr_n_i(lambdas(k),i)*(Tmin*2^j+L);
        end
    end
    ED(k) = ED(k) + (Tmax+L)*(1-p(lambdas(k)))*(1/(1-p(lambdas(k)))^2);
    for i = 0:m
    ED(k) = ED(k) - (Tmax+L)*(i+1)*p(lambdas(k))^i*(1-p(lambdas(k))); 
    end
end
% Calculation of the expected value of "D"



% plot the analytic results
plot(lambdas,ED, '-.r*');
xlabel('\lambda');
ylabel('E[D]')
title('Plot of E[D] versus \lambda, with T_{min}=1, T_{max}=1024 and L=1');
hold on;


%%
%!!!!!!modify wakeuptime!!!!!!
F = zeros(1,length(lambdas)); % expected values of "D", for each value of lambda, init to zero
maxerror = 0; % maximum error in the mean estimation
for k = 1:1:length(lambdas)
    % length of the simulation (in sleep cycle sequences)
    t = 0; % time of the next packet arrival
    V = zeros(1,1000000); % values of "n" ,for each execution
    for j = 1:length(V)
        % main simulation loop
        %  1. generate the time of the packet arrival
        t = exprnd(1/lambdas(k));
        %  2. Sleep until the next packet arrival
        T = Tmin; % length of sleep time
        i = 0; % length of sleep cycle
        % sleep
        wakeuptime = T+L;
        while wakeuptime<t
            i = i + 1;
            if i <= m
                T = 2^i * Tmin;
            end
            wakeuptime = wakeuptime + T+L;
        end
        V(j)=wakeuptime;
    end;
    F(k) = mean(V); % mean value of array V
    % update the maximum error
    [h,p,ci] = ttest(V,0); % t-test with 95% confidence level
    newerror = (ci(2)-ci(1))/2;
    % update the maximum error
    if newerror>maxerror
        maxerror = newerror;
    end
end
% plot the simulation results
plot(lambdas,F, '--mo');
legend('Analytic','Simulation', 2);
hold off;
% print the error
fprintf('Error: %.2f\n', maxerror);
 % Two-sample Kolmogorov-Smirnov test
[h,p,k]=kstest2(ED,F);
if h==1
	fprintf('Reject the null hypothesis that the distribution function is ED [5%% significance level]\n');
    fprintf('Hypothesized Function [rejected, p-value: %.2f]\n',p);
else
    fprintf('Accept the null hypothesis that the distribution function is ED\n');
    fprintf('Hypothesized Function [accepted, p-value: %.2f]\n',p);
 end
