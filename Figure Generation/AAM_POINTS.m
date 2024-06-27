I = imread('HA.png');
pts = dlmread('HA.pts');
%I2 = insertMarker(I,pts,'*');
I2 = insertText(I,pts(POINT_SEL,:),POINT_SEL,'AnchorPoint','center','TextColor','white','BoxOpacity',0);
imshow(I2)
imwrite(I2,'marked.jpg')