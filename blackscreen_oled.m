% 5.8.1. Blit Com to Display
% Serial Command cmd (word), x (word), y (word), width (word), height (word), data (data)
% cmd 0x000A
% x, y Specifies the horizontal and vertical position of the top-left corner of the image to be displayed
% width width of the image to be displayed
% height height of the image to be displayed
% data pixel1…pixeln
% 16 bit pixel data to be plotted on the Display screen.
% 16 bit = 5bit Red, 6bit Green, 5bit Blue

function [] = blackscreen_oled(s)

img = zeros(128,128,3);

% flips the red layer left-right, then flips the green layer left-right, 
% then flips the blue layer left-right of the 3D array 
img = flip_rgbImg_lr(img);

% Rotates 90 degrees because of the way we mounted it
img = imrotate(img,90);

si = size(img);

img = double(img);

if (numel(si)) == 2
    if (si(1)==si(2) && si(1)==128)
        disp('displaying monochrome image')
        for i=1:128
            for j=1:128
                r = bitshift(bitshift(img(i,j),-3),5+6);
                g = bitshift(bitshift(img(i,j),-2),5);
                b = bitshift(bitshift(img(i,j),-3),0);
                imgo(i,j) = uint16(r+g+b);
            end
        end
    else
        disp('Bad image format. Should be 128x128x1 or 128x128x3')
        exit();
    end
end

if (numel(si)) == 3
    if (si(1)==si(2) && si(1)==128 && si(3)==3)
        disp('converting to 16 bit color')
        for i=1:128
            for j=1:128
                r = bitshift(bitshift(img(i,j,1),-3),5+6);
                g = bitshift(bitshift(img(i,j,2),-2),5);
                b = bitshift(bitshift(img(i,j,3),-3),0);
                imgo(i,j) = uint16(r+g+b);
            end
        end
    else
        disp('Bad image format. Should be 128x128x1 or 128x128x3')
        exit();
    end
end
    

% Use the command to load an image, line by line
for k=1:128
    line = [bitshift(imgo(k,:),-8)' bitand(255,imgo(k,:))']';
    fwrite(s,[000 010 000 (k-1) 000 000 000 001 000 128]);
    fwrite(s,line(:));
    pause(0.1);
    f = fread(s,1);
    if f==6
        disp(['line ' int2str(k) ' success']);
    end
end

fwrite(s,[000 012 000 000]);
f = fread(s,1);
if f==6
        disp(['screensaver disabled']);
end

end

