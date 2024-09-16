%% Autoencoder
clear
close all
clc

tic


%% Information
% Latent space size
Lat = 4;

% Number of epochs
Epoch = 50000;


%% Load Data
load TimeSeries.mat
T = TimeSeries;

Decode_Auto = readmatrix(sprintf('Data_Lat%d_Epoch%d/Autoencoder_Output',Lat,Epoch));


%% Reshape
[Len, Dim] = size(T{1});

for i = 1:length(T)
     T_Auto{i,1} = reshape(Decode_Auto(i,:),Dim,Len)';
end


%% Comparision
% Time series ID (for all the time series, ID can be defined as a vector)
ID = 27;

for i = ID
fprintf('ID = %d\n',ID)

for j = 1:Dim
% Figure
Fig = figure('units','normalized','Position',[0.05 0.125 0.90 0.75]);
POS1 = [0.15 0.20 0.70 0.70];
hold on
grid on
box on


p1(i) = plot([1:Len],T{i,1}(:,j),'k-','linewidth',3);
p2(i) = plot([1:Len],T_Auto{i,1}(:,j),'r-.','linewidth',3);


rho_raw = corrcoef(T{i,1}(:,j),T_Auto{i,1}(:,j));
rho = rho_raw(1,2);

h = legend([p1(i) p2(i)],'Original','Reconstructed','location','northeast');

xlabel('Time Step') 
ylabel(sprintf('Dimension %d',j))

a1=gca;
set(a1,'LineWidth',2)
set(a1,'FontSize',28)
set(a1,'Position',POS1)

saveas(Fig, sprintf('CVAE Comp %d Dim%d.tiff',i,j));


% Goodness-of-fit
fprintf('Correlation coefficient in Dim %d = %.4f\n',j,rho);
fprintf('\n')

end
end


% close all

toc


