function [] = displayVerticalLine_oled(numOfPhysPixHeight, ...
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

% Compute the pixel index which is the center of the height and width of 
% the display then takes the floor since it must be an integer
centerOfPhysPixWidth = floor(numOfPhysPixWidth/2);
centerOfPhysPixHeight = floor(numOfPhysPixHeight/2);

% Create an all black screen 3D array 
myimg = zeros(numOfPhysPixHeight, numOfPhysPixWidth, 3);

% Puts a white line one physical pixel high at the middle of the width 
myimg(:,centerOfPhysPixWidth,:) = 255;

% Second 3D image array to the OLED
fullscreen_oled(oled, myimg)


end