function [] = displayBox_oled(numOfPhysPixHeight, ...
   numOfPhysPixWidth, oled)

% Returns the path to the unmixingExp directory for this computer
masPath = pathToHigherDir(pwd,'unmixingExp')

% The path to the unmixingExp/helperFunctions
helperFunctionPath = fullfile(masPath,'helperFunctions')

% The path to the oled functions
oledFunctionPath = fullfile(helperFunctionPath,'uoled128G2Functions')

addpath(masPath)
addpath(helperFunctionPath)
addpath(oledFunctionPath)

% The number of physical pixels in the horizontal direction
% numOfPhysPixWidth = 128;
% numOfPhysPixHeight = 128;


centerOfPhysPixWidth = floor(numOfPhysPixWidth/2);
centerOfPhysPixHeight = floor(numOfPhysPixHeight/2);

% Create an all black screen 3D array 
myimg = zeros(numOfPhysPixHeight, numOfPhysPixWidth, 3);


myimg(1,:,:) = 255;
myimg(numOfPhysPixHeight,:,:) = 255;
myimg(:,1,:) = 255;
myimg(:,numOfPhysPixWidth,:) = 255;

% Second 3D image array to the OLED
fullscreen_oled(oled, myimg)

end
