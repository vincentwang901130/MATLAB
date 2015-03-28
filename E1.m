% Data Rate
DR=[6,54,130,195,270];
% Sensitivity
RSS2=[-94,-79,-74,-71,-70];
RSS5=[-92,-79,-73,-70,-67];
% Transmission Power
P=20;
% Link Budget
L2=P-RSS2;
L5=P-RSS5;
% Distance
D2=power(10,(L2-40)/20);
D5=power(10,(L5-46.4)/20);
% Area Percentage
AP2=zeros(1,length(D2));
AP5=zeros(1,length(D5));
for i=1:1:length(D2)-1
    AP2(i)=(power(D2(i),2)-power(D2(i+1),2)) / power(D2(1),2);
end
AP2(length(D2))= power(D2(length(D2)),2) / power(D2(1),2);
 for i=1:1:length(D5)-1
    AP5(i)=(power(D5(i),2)-power(D5(i+1),2)) / power(D5(1),2);
end
AP5(length(D5))= power(D5(length(D5)),2) / power(D5(1),2);
% Number of User
Nu=100;
% Bit Period
Bp=1./DR;
% Air Time
AT2=zeros(1,5);
AT5=zeros(1,5);
for i=1:1:5;
AT2(i)=Nu*AP2(i)*Bp(i);
AT5(i)=Nu*AP5(i)*Bp(i);
end
% Total Air Time
TAT2=sum(AT2);
TAT5=sum(AT5);
% Airtime Percentage
AIRP2=AT2./TAT2;
AIRP5=AT5./TAT5;
% Chart
bar(AIRP2.*100);
set(gca,'xticklabel',DR);
xlabel('Data Rate in Mpbs');
ylabel('% of total airtime');

