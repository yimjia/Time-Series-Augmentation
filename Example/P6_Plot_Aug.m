%% Augmentation
clear
close all
clc

tic


%% Load Data
load Aug_TimeSeries.mat

load Aug_Lat.mat

load TimeSeries.mat
T = TimeSeries;

[Len, Dim] = size(T{1});

% Select which two dimensions to generate the comparison figure
Dim_All = [1:Dim]';
Dim_Plot = Dim_All(1:2);


%% Figure
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


for q = Num_Aug*(i-1)+1:Num_Aug*i
    p2(j,q) = plot([1:Len],T_Aug{q,1}(:,j),'-','color',[0.80 0.80 0.80],'linewidth',2);
end

p1 = plot([1:Len],T{i,1}(:,j),'k-','linewidth',2);

h = legend([p1 p2(j,q)],'Original','Variation of Augmented','location','northeast');

xlabel('Time Step') 
ylabel(sprintf('Dimension %d',j))

a1=gca;
set(a1,'LineWidth',2)
set(a1,'FontSize',28)
set(a1,'Position',POS1)

saveas(Fig, sprintf('CVAE Aug %d Dim%d.tiff',i,j));

end
end


% close all

toc

