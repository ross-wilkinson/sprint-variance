%% Visualise progression of variance over replicates

%% Dataset

maxPower = [1545; 1526; 1526; 1565; 1614; 1544;...
    1553; 1611; 1519; 1608; 1571; 1566];

% Set group data
y1 = maxPower(1:1);
y2 = maxPower(1:2);
y3 = maxPower(1:3);
y4 = maxPower(1:4);
y5 = maxPower(1:5);
y6 = maxPower(1:6);
y7 = maxPower(1:7);
y8 = maxPower(1:8);
y9 = maxPower(1:9);
y10 = maxPower(1:10);
y11 = maxPower(1:11);
y12 = maxPower(1:12);
y = [y1; y2; y3; y4; y5; y6; y7; y8; y9; y10; y11; y12];

% Create a grouping variable that assigns the same value to rows that correspond to the same vector in x.
g1 = repmat({'n=1'},1,1);
g2 = repmat({'n=2'},2,1);
g3 = repmat({'n=3'},3,1);
g4 = repmat({'n=4'},4,1);
g5 = repmat({'n=5'},5,1);
g6 = repmat({'n=6'},6,1);
g7 = repmat({'n=7'},7,1);
g8 = repmat({'n=8'},8,1);
g9 = repmat({'n=9'},9,1);
g10 = repmat({'n=10'},10,1);
g11 = repmat({'n=11'},11,1);
g12 = repmat({'n=12'},12,1);
g = [g1; g2; g3; g4; g5; g6; g7; g8; g9; g10; g11; g12];

%% Create box plot
figure('color','w','position', [50 0 800 450])
boxplot(y,g,'PlotStyle','compact')

hold on
str1 = {'t01';'t02';'t03';'t04';'t05';'t06';'t07';'t08';'t09';'t10';'t11';'t12'};
str2 = cellstr(num2str(maxPower));
str = strcat(str1,'=', str2, ' W');
text(1,1585,str)

xlabel('Number of sprints')
ylabel('Maximal 1-s power output (W)')
title({'Repeated sprints on traditional stationary ergometer','\rmBox plots'})

%% Fit kernel distributions
pd1 = fitdist(y1,'Kernel');
pd2 = fitdist(y2,'Kernel');
pd3 = fitdist(y3,'Kernel');
pd4 = fitdist(y4,'Kernel');
pd5 = fitdist(y5,'Kernel');
pd6 = fitdist(y6,'Kernel');
pd7 = fitdist(y7,'Kernel');
pd8 = fitdist(y8,'Kernel');
pd9 = fitdist(y9,'Kernel');
pd10 = fitdist(y10,'Kernel');
pd11 = fitdist(y11,'Kernel');
pd12 = fitdist(y12,'Kernel');

%% Compute pdf of kernel dist.
x = 1000:2000;
d1 = pdf(pd1,x);
d2 = pdf(pd2,x);
d3 = pdf(pd3,x);
d4 = pdf(pd4,x);
d5 = pdf(pd5,x);
d6 = pdf(pd6,x);
d7 = pdf(pd7,x);
d8 = pdf(pd8,x);
d9 = pdf(pd9,x);
d10 = pdf(pd10,x);
d11 = pdf(pd11,x);
d12 = pdf(pd12,x);

%% Plot pdf of kernel dist.
figure('color','w','position',[50 0 800 450])

plot(x,d1,'-','linewidth',2)
hold on
plot(x,d2,'-','linewidth',2)
plot(x,d3,'-','linewidth',2)
plot(x,d4,'-','linewidth',2)
plot(x,d5,'-','linewidth',2)
plot(x,d6,'-','linewidth',2)
plot(x,d7,'-','linewidth',2)
plot(x,d8,'--','linewidth',2)
plot(x,d9,'--','linewidth',2)
plot(x,d10,'--','linewidth',2)
plot(x,d11,'--','linewidth',2)
plot(x,d12,'--','linewidth',2)

text(1410,0.02,str)

xlabel('Maximal 1-s power output')
ylabel('Probability density')
title({'Repeated sprints on traditional stationary ergometer','\rmProbability density estimates'})

xlim([1400 1700])
ylim([0 0.03])

legend({'n=1','n=2','n=3','n=4','n=5','n=6','n=7','n=8','n=9','n=10','n=11','n=12'})
leg = legend;
leg.Box = 'off';

%% Test for Standard Normal Distribution
% test1 = random(pd12,1000,1);
test1 = random(pd12_bi,1000,1);
mu = mean(test1);
sigma = std(test1);
zdist = (test1-mu) / sigma;

[h,p] = kstest(zdist)
figure
cdfplot(zdist)
hold on
x_values = linspace(min(zdist),max(zdist));
plot(x_values,normcdf(x_values,0,1),'r-')
legend('Empirical CDF','Standard Normal CDF','Location','best')
