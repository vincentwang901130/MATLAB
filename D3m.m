%%
L = 1; % lenght of a listing interval
Tmin = 1; % minimum listening time
Tmax = 1024; % maximum listening time
m = log2(Tmax/Tmin);
%%% Analytic model
%%
% derived constant "c"
c = @(lambda)(exp(-lambda*(Tmin*(2^m-1) - m*Tmax)) * (1 - exp(-lambda*(Tmax + L))) ); 
% derived constant "p"
p = @(lambda)(exp(-lambda*(Tmax + L))); 
% probability distribution funtion of "n"
Pr_n_i = @(lambda, i)... % for 1<=i and i<=m
    (exp(-lambda*(Tmin*(2^i-1) + i*L) ) * (1 - exp(-lambda*(Tmin*(2^i-1) + L))));
% Calculation of the expected value of "n"
lambdas = 0.02:0.02:0.2; % calculations are done for 10 different values of lambda
E = zeros(1,length(lambdas)); % expected values of "n", for each value of lambda, init to zero
for k = 1:length(lambdas)
    % compute E[ n ] for lambdas(k)
    for i = 1:m
        E(k) = E(k) + i*Pr_n_i(lambdas(k),i);
    end
    E(k) = E(k) + p(lambdas(k))/(1-p(lambdas(k)));
    for i = 1:m
    E(k) = E(k) - i*p(lambdas(k))^i*(1-p(lambdas(k))); 
    end
end
% Calculation of the expected value of "D"
Var=0;
ED=zeros(1,length(E));
Eint=fix(E);
for k=1:length(E)   
    for i=0:1:Eint(k)+1
        Var=Var+(min(Tmin*(2^i),Tmax)+L);
    end
%  if Eint(k)<m
 %    ED(k)=Var+((2^(Eint(k)+1)*Tmin+L)*(E(k)-Eint(k)));
  %else
   %  ED(k)=Var+((Tmax+L)*(E(k)-Eint(k)));
  %end
   
     ED(k)=Var;
       Var=0;
end
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
	fprintf('Reject the null hypothesis that the distribution function is E [5%% significance level]\n');
    fprintf('Hypothesized Function [rejected, p-value: %.2f]\n',p);
else
    fprintf('Accept the null hypothesis that the distribution function is E\n');
    fprintf('Hypothesized Function [accepted, p-value: %.2f]\n',p);
 end