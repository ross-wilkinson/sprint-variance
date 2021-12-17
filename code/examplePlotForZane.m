%% Example plot for Zane

%% Create group data normally distributed around 5 for both conditions
a(:,1) = 5 + randn(16,1);
a(:,2) = 5 + randn(16,1);
a(:,3) = 5 + randn(16,1);
a(:,4) = 5 + randn(16,1);
a(:,5) = 5 + randn(16,1);
a(:,6) = 5 + randn(16,1);

%% Create figure
fig1 = figure('color','w','position',[50 50 200 300]);

x = 1:6;

% plot paired data
plot(a') 
hold on

% scatter plot with matching colors
set(gca,'ColorOrderIndex',1)
for i = 1:height(a)
    scatter(x,a(i,:),20,'filled','o')
end

% plot group mean line
plot(mean(a,'omitnan'),'k-','LineWidth',2)

% plot group mean scatter
scatter(x,mean(a,'omitnan'),40,'k','filled','o')

xlim([0 7])
ylim([0 10])
box off
ax = gca;
ax.XTick = 1:6;
