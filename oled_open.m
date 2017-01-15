function [ok] = oled_open(deviceId)

s = serial(deviceId,'BaudRate',9600,'timeout',1);
fopen(s);
fwrite(s,[255 215]); % Clean Screen
r = fread(s,1);
if r==6
    ok = s;
else
    disp('Unable to open device, check USB connection');
    
    ok = 0;
    fclose(s);
    delete(instrfind);
end

