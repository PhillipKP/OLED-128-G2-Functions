

addpath('C:\Users\lenslab\Dropbox\unmixingExp\data\oledGrabs')

grab1 = imread('expTime_pt50_scaleBy30_grab1.bmp');

grab2 = imread('expTime_pt50_scaleBy30_grab2.bmp');

diffGrab = abs(grab1 - grab2);

max(max(diffGrab))

figure;image(diffGrab);colormap gray; colorbar;