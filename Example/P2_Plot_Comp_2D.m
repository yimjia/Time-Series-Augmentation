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

% Select which two dimensions to generate the comparison figure
Dim_All = [1:Dim]';
Dim_Plot = Dim_All(1:2);


%% Comparision
% Time series ID (for all the time series, ID can be defined as a vector)
ID = 27;

for i = ID
% Figure
Fig = figure('units','normalized','Position',[0.05 0.05 0.88 0.88]);
POS1 = [0.15 0.15 0.7 0.7];
hold on
grid on
box on

pbaspect([1 1 1])

p1(i) = plot(T{i,1}(:,Dim_Plot(1)),T{i,1}(:,Dim_Plot(2)),'k-','linewidth',3);
p2(i) = plot(T_Auto{i,1}(:,Dim_Plot(1)),T_Auto{i,1}(:,Dim_Plot(2)),'r-.','linewidth',3);

for q = 1:2
    rho_raw = corrcoef(T{i,1}(:,Dim_Plot(q)),T_Auto{i,1}(:,Dim_Plot(q)));
    rho(q,1) = rho_raw(1,2);
    clearvars rho_raw
end

h = legend([p1(i) p2(i)],'Original','Reconstructed','location','southeast');

xlabel(sprintf('Dimension %d',Dim_Plot(1))) 
ylabel(sprintf('Dimension %d',Dim_Plot(2))) 

a1=gca;
set(a1,'LineWidth',2)
set(a1,'FontSize',28)
set(a1,'Position',POS1)
set(h,'FontSize',22)

saveas(Fig, sprintf('CVAE Comp %d Dim%d%d.tiff',i,Dim_Plot));


% Goodness-of-fit
fprintf('ID = %d\n',ID)
for q = 1:2
    fprintf('Correlation coefficient in Dim %d = %.4f\n',Dim_Plot(q),rho(q,1));
end
fprintf('\n')

end



% close all

toc


