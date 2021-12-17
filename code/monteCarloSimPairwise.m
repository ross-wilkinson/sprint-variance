% Monte-Carlo Simulation

pd_downhill = makedist('Normal','mu',2.7,'sigma',2.49);
pd_level = makedist('Normal','mu',3.83,'sigma',1.89);

nSamples = 16;
for i = 1:10000
    sample1 = random(pd_downhill,nSamples,1);
    sample2 = random(pd_level,nSamples,1);
    [~,p] = ttest(sample1,sample2);
    rho(i) = p;
    mean_diff(i) = mean(sample1 - sample2);
    std_diff(i) = std(sample1 - sample2);
    ES(i) = mean_diff(i) / std_diff(i);
end
figure('name','Diff. in Downhill vs. Diff. in Level (p-values)')
histogram(rho,20)
xlabel('p-values')
ylabel('Count (500 = 5% chance)')

figure('name','Diff. in Downhill vs. Diff. in Level (ES)')
histogram(ES,20)
xlabel('Effect size (Cohen''s d_z)')
ylabel('Count (500 = 5% chance)')
