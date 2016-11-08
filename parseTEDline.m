function [voiSplit,voiMerge,voiTot, randind, arand,...
            tedFP, tedFN, tedFS, tedFM, tedTot] = parseTEDline(tline)

% 01 VOI split: 0, 
% 02 VOI merge: 5.11965, 
% 03 VOI total: 5.11965;
% 04 RAND: 0.0489372, 
% 05 ARAND: 0.906683; 
% 06 DO_FP: 10, 
% 07 DO_FN: 29, 
% 08 DO_PRE: 0.87013, 
% 09 DO_REC: 0.697917, 
% 10 DO_FS: 0.774566, 
% 11 DO_MEAN_M1: 62.1795, 
% 12 DO_STD_M1: 24.4636, 
% 13 DO_MEAN_M2: 69.2686, 
% 14 DO_STD_M2: 23.8326, 
% 15 DO_MEAN_DICE: 0.731236, 
% 16 DO_STD_DICE: 0.239251; 
% 17 TED FP: 4, 
% 18 TED FN: 7, 
% 19 TED FS: 14, 
% 20 TED FM: 30, 
% 21 TED Total: 55

splitstr = strsplit(tline,',');
if(length(splitstr)>3)
        % we have a ted output string
    tmp = strsplit(char(splitstr(1)),':');
    voiSplit = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(2)),':');
    voiMerge = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(3)),':');
    voiTot = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(4)),':');
    randind = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(5)),':');
    arand = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(17)),':');
    tedFP = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(18)),':');
    tedFN = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(19)),':');
    tedFS = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(20)),':');
    tedFM = str2double(tmp(2));
    
    tmp = strsplit(char(splitstr(21)),':');
    tedTot = str2double(tmp(2));
        
else
    error('Invalid string!')
end