%% simulate t-test between pdf

for i = 1:10000
    x = random(pd12,3,1);
    y = random(pd12,3,1);
    [h,p,ci,stats] = ttest2(x,y);
    rho(i) = p;
end


    