pts = dlmread('HA.pts');
load('POINT_SEL.mat');
[HOG,DI] = triangle_image(pts(POINT_SEL,:));
DI(isnan(DI)) = 0;
DI(isinf(DI)) = 0;
TEX = cell(5,5);
CS = [5 5];
BS = [5 5];

for i = 1:5
    for j = 1:5
        TEX{i,j} = squeeze(DI(i+j-1,:,:));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TEX2 = cell2mat(TEX);
[features,ptVis] = extractHOGFeatures(TEX2,'CellSize',CS,'BlockSize',BS); 
figure
plot(ptVis)