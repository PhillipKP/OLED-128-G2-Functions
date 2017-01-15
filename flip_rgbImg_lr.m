function [rgbImgOut] = flip_rgbImg_lr(rgbImgIn)
% [rgbImg] = flip_rgbImg_lr(rgbImg)
%
% Since fliplr only works on 2D images
% This works on 3D images

rgbImgOut = zeros(size(rgbImgIn));

for colorLayerInd = 1:3
   
    clear tmpImg tmpImg2
    
    tmpImg = rgbImgIn(:,:,colorLayerInd);
    
    tmpImg2 = fliplr(tmpImg);
    
    rgbImgOut(:,:,colorLayerInd) = tmpImg2;
    
end