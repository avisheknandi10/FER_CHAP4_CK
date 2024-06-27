I = imread('HA.png');
pts = dlmread('HA.pts');
load('POINT_SEL.mat');
pts2 = pts(POINT_SEL,:);
LINES = get_lines(pts2);
LINES2 = LINES(1:3:end,:);
J = insertShape(I,'Line',LINES2);%,'LineWidth',2,'Color','cyan','Opacity','0.4');
imshow(J)