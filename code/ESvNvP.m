%% Relations between effect size, sample size, and p-value

%% Initialize
clear; clc; close all

%% Create probability distribution for two conditions
mu1 = 21; sigma1 = 2;
mu2 = 20; sigma2 = 2;
pd1 = makedist('Normal','mu',mu1,'sigma',sigma1);
pd2 = makedist('Normal','mu',mu2,'sigma',sigma2);

%% Set sample size range
sampleSize = 2:120;
[t, es, rho, meanDiff, stdDiff] = deal(NaN(1,length(sampleSize)));

%% Create figure
figure('color','w','position',[50 50 1000 500])

%% Create subplot of sample distributions
subplot(2,3,1:3)

x = linspace(10,31,1001);
pdf1 = pdf(pd1,x);
pdf2 = pdf(pd2,x);

plot(x,pdf1,'b','linewidth',2)
hold on
plot(x,pdf2,'r','linewidth',2)

line([mu1 mu1],[0 max(pdf1)],'color','b')
line([mu2 mu2],[0 max(pdf2)],'color','r')

line([mu1+sigma1 mu1+sigma1],[0 mean(pdf1(round(x,1)==mu1+sigma1))],'color','b','linestyle','--')
line([mu1-sigma1 mu1-sigma1],[0 mean(pdf1(round(x,1)==mu1-sigma1))],'color','b','linestyle','--')
line([mu2+sigma2 mu2+sigma2],[0 mean(pdf2(round(x,1)==mu2+sigma2))],'color','r','linestyle','--')
line([mu2-sigma2 mu2-sigma2],[0 mean(pdf2(round(x,1)==mu2-sigma2))],'color','r','linestyle','--')

% Edit axes
box off
xlim([10 30])
xlabel('Outcome measure (arbitrary units)')
ylabel('Probability distribution (x)')
leg = legend('Condition 1','Condition 2');
leg.Box = 'off';

%% Run simulations for ES = 0.2
esLow = 0.198;
esHigh = 0.202;

i = 0;
for n = sampleSize
    i = i+1;
    es(i) = 1;
    while es(i) > esHigh || es(i) < esLow
        sample1 = random(pd1,n,1);
        sample2 = random(pd2,n,1);
        [~,p] = ttest(sample1,sample2);
        rho(i) = p;
        meanDiff(i) = mean(sample1 - sample2);
        stdDiff(i) = std(sample1 - sample2);
        es(i) = meanDiff(i) / stdDiff(i);
        t(i) = es(i) * sqrt(n);
    end
end

%% Subplot 1 -  0.2
subplot(234)
plot(sampleSize,es,'k','linewidth',1)
box off
ylim([0 1])
xlabel('Sample Size (n)')
ylabel('Effect Size')

yyaxis right
plot(sampleSize,rho,'linewidth',1)
hold on
line([sampleSize(1) sampleSize(end)],[0.05 0.05],'linestyle','--','linewidth',1);
box off
ylim([0 1])
ylabel('p-value (paired t-test)')

title('Effect Size = 0.2')

disp('Plot 1 complete')

%% Run simulations for ES = 0.4
esLow = 0.396;
esHigh = 0.404;

i = 0;
for n = sampleSize
    i = i+1;
    es(i) = 1;
    while es(i) > esHigh || es(i) < esLow
        sample1 = random(pd1,n,1);
        sample2 = random(pd2,n,1);
        [~,p] = ttest(sample1,sample2);
        rho(i) = p;
        meanDiff(i) = mean(sample1 - sample2);
        stdDiff(i) = std(sample1 - sample2);
        es(i) = meanDiff(i) / stdDiff(i);
    end
end

%% Subplot 2 -  0.3
subplot(235)
plot(sampleSize,es,'k','linewidth',1)
box off
ylim([0 1])
xlabel('Sample Size (n)')
ylabel('Effect Size')

yyaxis right
plot(sampleSize,rho,'linewidth',1)
hold on
line([sampleSize(1) sampleSize(end)],[0.05 0.05],'linestyle','--','linewidth',1)
box off
ylim([0 1])
ylabel('p-value (paired t-test)')

title('Effect Size = 0.4')

disp('Plot 2 complete')

%% Run simulations for ES = 0.6
esLow = 0.594;
esHigh = 0.606;

i = 0;
for n = sampleSize
    i = i+1;
    es(i) = 1;
    while es(i) > esHigh || es(i) < esLow
        sample1 = random(pd1,n,1);
        sample2 = random(pd2,n,1);
        [~,p] = ttest(sample1,sample2);
        rho(i) = p;
        meanDiff(i) = mean(sample1 - sample2);
        stdDiff(i) = std(sample1 - sample2);
        es(i) = meanDiff(i) / stdDiff(i);
    end
end

%% Subplot 2 -  0.6
subplot(236)
plot(sampleSize,es,'k','linewidth',1)
box off
ylim([0 1])
xlabel('Sample Size (n)')
ylabel('Effect Size')

yyaxis right
plot(sampleSize,rho,'linewidth',1)
hold on
line([sampleSize(1) sampleSize(end)],[0.05 0.05],'linestyle','--','linewidth',1)
box off
ylim([0 1])
ylabel('p-value (paired t-test)')

title('Effect Size = 0.6')

disp('Plot 3 complete')

%% Save figure
export_fig('fig_ESvNvP','-png','-cmyk','-r900')
