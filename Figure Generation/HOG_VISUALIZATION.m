I = imread('HA.png');
pts = dlmread('HA.pts');
CS = [16 16];
BS = [4 4];
pts2 = pts(POINT_SEL,:);
[features,validPoints,ptVis] = extractHOGFeatures(I,pts2,'CellSize',CS,'BlockSize',BS); 
figure
imshow(I)
hold on
plot(ptVis,'color','white')