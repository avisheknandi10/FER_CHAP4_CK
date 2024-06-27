I = imread('HA.png');
pts = dlmread('HA.pts');
I2 = insertMarker(I,pts,'*');
%imshow(I2)
imwrite(I2,'marked.jpg')