%% Why bar graphs shouldn't be used for paired data

%% Initialize
clear; clc; close all

%% Set dirs
docDir = '/Users/rosswilkinson/Google Drive/projects/sprint-variance/docs';

%% Create two groups (n=16) with small difference in mean and large standard
% deviation
nSamples = 16;

mu1 = 100;
sigma1 = 15;
y1 = mu1 + sigma1.*randn(nSamples,1);
stats1 = [mean(y1) std(y1)];

mu2 = 105;
sigma2 = 15;
y2 = mu2 + sigma2.*randn(nSamples,1);
stats2 = [mean(y2) std(y2)];

y1_sorted = sort(y1);
y2_sorted = sort(y2);

%% Run stats
mean_diff1 = mean(y1_sorted - y2_sorted);
std_diff1 = std(y1_sorted - y2_sorted);
ES1 = mean_diff1 / std_diff1;
[~,p1] = ttest(y1_sorted,y2_sorted);

mean_diff2 = mean(y1 - y2);
std_diff2 = std(y1 - y2);
ES2 = mean_diff2 / std_diff2;
[~,p2] = ttest(y1,y2);

%% Create figure
fig1 = figure('color','w','position',[50 50 600 300]);

%% Plot as bar graph
data = [stats1(1) stats2(1)]; 

ax1 = subplot(131);
x = [1 2];
bar(x,data,'w')
hold on
errHigh = [stats1(2) stats2(2)];
er = errorbar(x,data,[],errHigh); 
er.LineStyle = 'none';
er.Color = [0 0 0];

xlim([0 3])
ylim([0 140])
box off

%% Sort differences and plot individual results
data2 = [y1_sorted y2_sorted];

ax2 = subplot(132);
plot(data2(:,1:2)')
hold on
set(ax2,'ColorOrderIndex',1)
for i = 1:height(data2)
    scatter(x,data2(i,1:2),20,'filled','o')
end

plot(mean(data2(:,1:2),'omitnan'),'k-','LineWidth',2)
scatter(x,mean(data2(:,1:2),'omitnan'),40,'k','filled','o')

xlim([0 3])
ylim([0 140])
box off
ax2.XTick = 1:2;
title({'Could be this',['\rmEffect Size = ' num2str(abs(round(ES1,1)))], ['\rmp = ' num2str(round(p1,3))]})

%% Randomize differences and plot individual results
data3 = [y1 y2];

ax3 = subplot(133);
plot(data3(:,1:2)')
hold on
set(ax3,'ColorOrderIndex',1)
for i = 1:height(data3)
    scatter(x,data3(i,1:2),20,'filled','o')
end

plot(mean(data3(:,1:2),'omitnan'),'k-','LineWidth',2)
scatter(x,mean(data3(:,1:2),'omitnan'),40,'k','filled','o')

xlim([0 3])
ylim([0 140])
box off
ax3.XTick = 1:2;
title({'Or this',['\rmEffect Size = ' num2str(abs(round(ES2,1)))], ['\rmp = ' num2str(round(p2,3))]})

%% Annotate axes


%% Save figure
cd(docDir)
export_fig(fig1,'fig_dontUseBarGraphs','-png','-cmyk','-r600')
