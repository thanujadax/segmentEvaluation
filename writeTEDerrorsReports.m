function writeTEDerrorsReports(ted,totSlices,errorReportRoot)

fpFile = fullfile(errorReportRoot,'fp.txt');
fnFile = fullfile(errorReportRoot,'fn.txt');
fsFile = fullfile(errorReportRoot,'fs.txt');
fmFile = fullfile(errorReportRoot,'fm.txt');
totFile = fullfile(errorReportRoot,'tot.txt');

fid_fp = fopen(fpFile,'a');
fid_fn = fopen(fnFile,'a');
fid_fs = fopen(fsFile,'a');
fid_fm = fopen(fmFile,'a');
fid_tot = fopen(totFile,'a');

% fprintf(fid,'VoI Split: %f \n',sum(ted.voiSplit)/totSlices);
% fprintf(fid,'VoI Merge: %f \n',sum(ted.voiMerge)/totSlices);
% fprintf(fid,'VoI Tot: %f \n',sum(ted.voiTot)/totSlices);
% fprintf(fid,'Rand ind: %f \n',sum(ted.randind)/totSlices);
% fprintf(fid,'ARand: %f \n',sum(ted.arand)/totSlices);
fprintf(fid_fp,'%f\n',sum(ted.tedFP)/totSlices);
fprintf(fid_fn,'%f\n',sum(ted.tedFN)/totSlices);
fprintf(fid_fs,'%f\n',sum(ted.tedFS)/totSlices);
fprintf(fid_fm,'%f\n',sum(ted.tedFM)/totSlices);
fprintf(fid_tot,'%f\n',sum(ted.tedTot)/totSlices);

fclose(fid_fp);
fclose(fid_fn);
fclose(fid_fs);
fclose(fid_fm);
fclose(fid_tot);