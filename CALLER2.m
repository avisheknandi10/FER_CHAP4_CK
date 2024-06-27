

load('DataBase.mat');
load('DATASET.mat');
%DATASET2  = cell2mat(DATASET');
DATASET2 = DATASET(:,sum(DATASET)>0)';
[y,bcm,bper,ACC1] = train5(DATASET2,EXP2');
save('BCM.mat','bcm','bper','ACC1')
% netSize = 10;
% PERF = train_and_cross_validate2(DATASET2,EXP2',netSize);
% save('PERF.mat','PERF');
% ACC = mean(1-PERF);
% save('ACC.mat','ACC')
fprintf('Overall Performance: %d\n',mean(ACC1))
