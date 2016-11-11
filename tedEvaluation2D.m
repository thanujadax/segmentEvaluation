% input file paths
% use ted for evaluating 2D segments
% use copyEachImgIntoSubDir.m to put each 2D image 
% after creating the outputFile using this script, use readTedOutput to get
% the per slice normalized error for all sections
groundTruthDir = '/home/thanuja/RESULTS/cvpr/TED/groundtruth';
reconstructionDir = '/home/thanuja/RESULTS/cvpr/TED/cnn';
configurationFile = '/home/thanuja/projects/RESULTS/contours/ted/20161107_isbi000_indexed/ted.conf';
outputFile = '/home/thanuja/RESULTS/cvpr/TED/cnn/output_30.txt';
gtType = 'tif';
rType = 'tif';

% tedCommand = '/home/thanuja/projects/external/ted/build/binaries/ted';
tedCommand = '/home/thanuja/projects/RESULTS/contours/ted/20161107_isbi000_indexed/ted';

groundTruthList = dir(groundTruthDir);
reconstructionList = dir(reconstructionDir);

groundTruthList(1:2) = [];
reconstructionList(1:2) = [];

numGT = length(groundTruthList);
numRec = length(reconstructionList);

% if(numGT ~= numRec)
%     error('Number of ground truth images and reconstruction images are not equal!');
% else
    for i=1:numGT
    % write the full command
    unixCommand = sprintf(...
        ['%s '...
        '--groundTruth=%s '...
        '--reconstruction=%s >> %s'],...
        tedCommand,...
        fullfile(groundTruthDir,groundTruthList(i).name),...
        fullfile(reconstructionDir,reconstructionList(i).name),...
        outputFile);
    
    disp(unixCommand);
    status = unix(unixCommand);
    
    % append new line
    fid = fopen(outputFile,'a');
    fprintf(fid,'\n');
    fclose(fid);
    
    end
% end
    
