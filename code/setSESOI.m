%% How to set smallest effect size of interest i.e. smallest meaningful difference

%% Initialize
clear;clc;close all

%% What is the smallest meaningful difference?
mu = 1; % as a percentage

%% What is an acceptable confidence limit?
CL_threshold = 0.73;

%% What effect size gives this CL?
for sesoi = 0:0.001:3
    CL = normcdf(sesoi);
    if CL > CL_threshold
        break
    end
end

%% Calculate standard deviation from sesoi
sigma = mu / sesoi;

%% Create probability distribution of differences
pd = makedist('Normal','mu',mu,'sigma',sigma);

%% Calculate probability and cumulative distribution functions
x = mu - (sigma * 4):0.01:mu + (sigma * 4);
y1 = pdf(pd,x);
y2 = cdf(pd,x);

%% Calculate sample size required to detect SESOI
alpha = 0.05;

for n = 1:300
    p = 2 * tcdf(-(mu / ( sigma / sqrt(n))),n-1);
    if p < alpha
        break
    end
end

%% Plot pd
plot(x,y1,'k')
hold on

%% Shade > 0
i0 = find(round(x,2)==0,1);
patch([x(i0:end) fliplr(x(i0:end))], [y1(i0:end) zeros(1,length(y1(i0:end)))],...
    [1 1 1]*0,'facealpha',0.1,'linestyle','none')

%% Lines at mu and +/- sigma
line([mu mu],[0 max(y1)],'color','k')
line([mu-sigma mu-sigma],[0 mean(y1(round(x,1)==mu-round(sigma,1)))],'color','k','linestyle','--')
line([mu+sigma mu+sigma],[0 mean(y1(round(x,1)==mu+round(sigma,1)))],'color','k','linestyle','--')

%% Edit axes
set(gcf,'color','w')
ax = gca;
box off
xlabel('% Difference')
ylabel('Probability Distribution (x)')

text(mu+sigma*1.645,max(y1)*(2/3),{...
    ['Mean = ' num2str(mu) '%'],...
    ['Standard Deviation = ' num2str(round(sigma,2)) '%'],...
    ['Confidence Limit = ' num2str(CL_threshold*100) '%'],...
    ['SESOI = ' num2str(sesoi)],...
    ['Significance Level = ' num2str(alpha)],...
    ['Sample Size Req. = ' num2str(n)]},'FontSize',10);

%% Save figure
% export_fig('fig_sesoi_rocknorock','-png','-grey','-r900')
