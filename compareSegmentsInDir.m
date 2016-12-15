function compareSegmentsInDir()

% the images should be index images (1...K)
groundTruthDir = '/home/thanuja/DATA/ISBI2012/gala/flatfiles/test/gt-index';
% groundTruthImg = '/home/thanuja/DATA/ISBI2012/gala/flatfiles/test/probMaps_rfc/020.tif';
reconstructionsDir = '/home/thanuja/RESULTS/isbi2012/rfc_ilp_cnn/test_21_30_bwidx';

gtType = 'tif';
rType = 'png';

outputFile = '/home/thanuja/RESULTS/isbi2012/rfc_ilp_cnn/test_21_30_bwidx/eval.txt';

gtFileList = dir(fullfile(groundTruthDir,strcat('*.',gtType)));
rFileList = dir(fullfile(reconstructionsDir,strcat('*.',rType)));

if(length(gtFileList) ~= length(rFileList))
    disp('Number of GT files and reconstructions do not match!!!')
else
    numImg = length(rFileList);
    ri = zeros(numImg,1);
    gce = zeros(numImg,1);
    vi = zeros(numImg,1);
    ri_n = zeros(numImg,1);
    gce_n = zeros(numImg,1);
    vi_n = zeros(numImg,1);
    numSegments = zeros(numImg,1);
    fid = fopen(outputFile,'w');
    fprintf(fid,'RI, GCE, VoI for each image \n');
    for i=1:numImg
        gtLabels = imread(fullfile(groundTruthDir,gtFileList(i).name));
        % gtLabels = imread(groundTruthImg);
        reconsImg = imread(fullfile(reconstructionsDir,rFileList(i).name));
        [ri(i),gce(i),vi(i)]=compareSegmentations(gtLabels,reconsImg);  
        % get num slices in gt
        gtBW = im2bw(gtLabels,0);
        cc = bwconncomp(gtBW);
        numSegments(i) = length(cc.PixelIdxList);
        ri_n(i) = ri(i);
        gce_n(i) = gce(i);
        vi_n(i) = vi(i);
        fprintf(fid,'Image:%d , RI=%f, GCE=%f, VoI=%f, numSeg=%d\n',...
            i,ri_n(i),gce_n(i),vi_n(i));
    end
    % get the avg scores over all images
    ri_n_av = mean(ri_n);
    gce_n_av = mean(gce_n);
    vi_n_av = mean(vi_n);
    
    fprintf(fid,'****************************************');
    fprintf(fid,'Average per image: RI=%f, GCE=%f, VoI=%f',ri_n_av,gce_n_av,vi_n_av);
    
    
    fclose(fid);
end

