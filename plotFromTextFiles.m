function plotFromTextFiles()

% plot tot ted error
file_cnn_gala = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/cnn_gala/tot.txt';
file_cnn_graphcut = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/cnn_graphcut/tot.txt';
file_cnn_stc = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/cnn_stc/tot.txt';
file_rfc_gala = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/rfc_gala/tot.txt';
file_rfc_graphcut = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/rfc_graphcut/tot.txt';
file_rfc_stc = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/rfc_stc/tot.txt';
file_bootstrap = '/home/thanuja/RESULTS/cvpr/TED2/tedOut/bootstrap-rfc_stc_cnn_stc/tot.txt';

fid = fopen(file_cnn_gala,'r');
ted_cnn_gala = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_cnn_graphcut,'r');
ted_cnn_graphcut = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_cnn_stc,'r');
ted_cnn_stc = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_rfc_gala,'r');
ted_rfc_gala = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_rfc_graphcut,'r');
ted_rfc_graphcut = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_rfc_stc,'r');
ted_rfc_stc = fscanf(fid,'%f\n');
fclose(fid);

fid = fopen(file_bootstrap,'r');
ted_bootstrap = fscanf(fid,'%f\n');
fclose(fid);

x = 0:40;

figure(100);
plot(x,ted_cnn_gala,'-.','DisplayName','CNN:Gala','LineWidth',2.5);
hold on
plot(x,ted_cnn_graphcut,'-.','DisplayName','CNN:GC','LineWidth',2.5);
plot(x,ted_cnn_stc,'-.o','DisplayName','CNN:STC','LineWidth',2.5);
plot(x,ted_rfc_gala,'DisplayName','RFC:Gala','LineWidth',2.5);
plot(x,ted_rfc_graphcut,'DisplayName','RFC:GC','LineWidth',2.5);
plot(x,ted_rfc_stc,'--o','DisplayName','RFC:STC','LineWidth',2.5);
% plot(x,ted_bootstrap,'DisplayName','RFC:Bootsrap','LineWidth',2.5);
hold off
ylabel('TED per segment')
xlabel('Tolerance (\theta) in pixels')