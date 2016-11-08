function writeTEDerrorsToFile(ted,totSlices,errorReportFileName)

fid = fopen(errorReportFileName,'w');

fprintf(fid,'VoI Split: %f \n',sum(ted.voiSplit)/totSlices);
fprintf(fid,'VoI Merge: %f \n',sum(ted.voiMerge)/totSlices);
fprintf(fid,'VoI Tot: %f \n',sum(ted.voiTot)/totSlices);
fprintf(fid,'Rand ind: %f \n',sum(ted.randind)/totSlices);
fprintf(fid,'ARand: %f \n',sum(ted.arand)/totSlices);
fprintf(fid,'tedFP: %f \n',sum(ted.tedFP)/totSlices);
fprintf(fid,'tedFN: %f \n',sum(ted.tedFN)/totSlices);
fprintf(fid,'tedFS: %f \n',sum(ted.tedFS)/totSlices);
fprintf(fid,'tedFM: %f \n',sum(ted.tedFM)/totSlices);
fprintf(fid,'tedTot: %f \n',sum(ted.tedTot)/totSlices);

fclose(fid);