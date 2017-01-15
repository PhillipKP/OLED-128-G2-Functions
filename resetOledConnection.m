function [] = resetOledConnection(serialObject)

% Disconnects and deletes all instrument objects
instrreset

% Check to see is the an object named the serialObject exists
% makes sure it isn't an M-File on MATLAB's search 
% path then clears it. 

if (exist(serialObject) ~= 0) && (exist(serialObject) ~= 2)
    
    if isa(serialObject, 'serial')
        
            clear serialObjects
        
    end
    
end
