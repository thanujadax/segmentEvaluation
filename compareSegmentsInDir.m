function compareSegmentsInDir()

% the images should be index images (1...K)
groundTruthDir = '';
reconstructionsDir = '';

gtType = '';
rType = '';

outputFile = '';

gtFileList = dir(fullfile(groundTruthDir,strcat('*.',gtType)));
rFileList = dir(fullfile(reconstructionsDir,strcat('*.',rType)));

if(length(gtFileList) ~= length(rFileList))
    error('Number of GT files and reconstructions do not match!!!')
else
    numImg = length(gtFileList);
    ri = zeros(numImg,1);
    gce = zeros(numImg,1);
    vi = zeros(numImg,1);
    ri_n = zeros(numImg,1);
    gce_n = zeros(numImg,1);
    vi_n = zeros(numImg,1);
    numSegments = zeros(numImg,1);
    fid = fopen(outputFile,'w');
    fprintf(fid,'Normalized RI, GCE, VoI for each image per segment \n');
    for i=1:numImg
        gtLabels = imread(fullfile(groundTruthDir,gtFileList(i).name));
        reconsImg = imread(fullfile(reconstructionsDir,rFileList(i).name));
        [ri(i),gce(i),vi(i)]=compareSegmentations(gtLabels,reconsImg);  
        % get num slices in gt
        gtBW = im2bw(gtLabels,0);
        cc = bwconncomp(gtBW);
        numSegments(i) = length(cc.PixelIdxList);
        ri_n(i) = ri(i)/numSegments(i);
        gce_n(i) = gce(i)/numSegments(i);
        vi_n(i) = vi(i)/numSegments(i);
        fprintf(fid,'Image:%d , RI=%f, GCE=%f, VoI=%f, numSeg=%d\n',...
            i,ri_n(i),gce_n(i),vi_n(i),numSegments(i));
    end
    % get the avg scores (normalized per segment)
    ri_n_av = mean(ri_n);
    gce_n_av = mean(gce_n);
    vi_n_av = mean(vi_n);
    
    fprintf(fid,'****************************');
    fprintf(fid,'Average: RI=%f, GCE=%f, VoI=%f',ri_n_av,gce_n_av,vi_n_av);
    
    
    fclose(fid);
end

