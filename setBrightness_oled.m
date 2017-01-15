function [] = setBrightness_oled(oled, brightSet)
% brightSet is a number from 0 to 15, where 0 is off and 15 is the maximum
% brightness


% Returns the path to the unmixingExp directory for this computer
masPath = pathToHigherDir(pwd,'unmixingExp')

% The path to the unmixingExp/helperFunctions
helperFunctionPath = fullfile(masPath,'helperFunctions')

% The path to the oled functions
oledFunctionPath = fullfile(helperFunctionPath,'uoled128G2Functions')

addpath(masPath)
addpath(helperFunctionPath)
addpath(oledFunctionPath)

fwrite(oled,[hex2dec('FF') hex2dec('66') hex2dec('00') brightSet])

end
