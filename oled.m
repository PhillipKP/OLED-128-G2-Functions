% 5.8.1. Blit Com to Display
% Serial Command cmd (word), x (word), y (word), width (word), height (word), data (data)
% cmd 0x000A
% x, y Specifies the horizontal and vertical position of the top-left corner of the image to be displayed
% width width of the image to be displayed
% height height of the image to be displayed
% data pixel1…pixeln
% 16 bit pixel data to be plotted on the Display screen.
% 16 bit = 5bit Red, 6bit Green, 5bit Blue

% 5.9.4. Screen Saver Timeout
% Serial Command cmd (word), timeout(word)
% cmd 0x000C
% timeout Specifies the screen saver timeout in milliseconds. Timeout value
% could be 1-65535. 0 disables the screen saver.

function [ok] = oled_open()

s = serial('COM3','BaudRate',9600,'timeout',1);
fopen(s);
fwrite(s,[255 215]); % Clean Screen
r = fread(s,1);
if r==6
    ok = s;
else
    disp('Unable to open device, check USB connection');
    ok = 0;
end


function [ok] = oled_displayimg(img)

