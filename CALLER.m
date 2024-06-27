%The caller function
PATH = 'E:\CK+\Emotion\';
CS = [16 16];
BS = [4 4];

[EXP,EXP2,HOG_POINTWISE] = getHogsPointwise(PATH,CS,BS);
save('DataBase.mat','EXP','EXP2','HOG_POINTWISE');
%perf = train_pointwise(HOG_POINTWISE,EXP2,10);
netSize = 10;
Per = train_pointwise(HOG_POINTWISE,EXP2,netSize);
% save('perf.mat','perf');
PACC = sum(Per,2)/7;
save('PER.mat','Per','PACC');
noPoint = 25;
%select points 
[~,POINT_SEL] = maxk(PACC,noPoint); 
save('POINT_SEL.mat','POINT_SEL');
%POINT_SEL = select_Expression_Points(EXP_PERF,noPoint);
%path_to_images = 'C:\Users\Avishek\Desktop\Research Writings\CALCON 2020\CODING\HOG BASED POINT SELECTION CK+2\IMAGES\';
%DisplayPointSelection(POINT_SEL,path_to_images)
%PointSelectionSaveImage(POINT_SEL,path_to_images)
%save('POINT_SEL.mat','POINT_SEL');

DATASET = computeDatabase(PATH,POINT_SEL);
save('DATASET.mat','DATASET');
%DATASET2  = cell2mat(DATASET');
DATASET2 = DATASET(:,sum(DATASET)>0)';
[bcm,bper,ACC1] = train5(DATASET2,EXP2');
save('BCM.mat','bcm','bper','ACC1')
netSize = 10;
PERF = train_and_cross_validate2(DATASET2,EXP2',netSize);
save('PERF.mat','PERF');
ACC = mean(1-PERF);
save('ACC.mat','ACC')
fprintf('Overall Performance: %d\n',mean(ACC))

 