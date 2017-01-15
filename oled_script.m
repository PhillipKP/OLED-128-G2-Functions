% oled_script

% closes and disconnects all instrument objects
% This should only be at the beginning of the script
resetOledConnection('oled')

% This may need to be changed especially on different computers
% Use the commands instrhwinfo('serial') if you want to know which COM
% ports are availible
deviceId = 'COM3'

% Creates the serial object that points to the oled
pause(3)
oled = oled_open(deviceId);

% Load image and size it
refimg2 = imread('mario128by128.jpg');
%refimg2 = imresize(refimg2, [32 32]);
refimg2 = imresize(refimg2, [64 64], 'box');

% serialInfo = instrhwinfo('serial')
figure(343);image(refimg2); title('Image sent to display')
    

% Scale the intensity 
refimg2 =  100*(refimg2 / max(refimg2(:)) );

figure(344); image(refimg2); title('Scaled Image sent to display')
    
% This displays all black on the OLED
pause(3)
% fullscreen_oled(oled,refimg2)

myimg = imread('dukeLogo.png');

%fullscreen_oled(oled,myimg);
%blackscreen_oled(oled);
%fclose(oled);


% myimg = imread('dukeLogo.png');
% 
% for li = 1:3
%     myimgTemp(:,:,li) = imresize(myimg(:,:,li), [128 128]);
% end

%load('cb128.mat','cb128')
%myimgTemp = cb128;
% Second 3D image array to the OLED
fullscreen_oled(oled, refimg2)
