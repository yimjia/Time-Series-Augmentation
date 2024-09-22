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
Fig = figure('units','normalized','Position',[0.05 0.05 0.88 0.88]);
POS1 = [0.15 0.15 0.7 0.7];
hold on
grid on
box on

pbaspect([1 1 1])

% In this example, zero padding is used to make each extratropical cyclone 
% record have the same duration. In this figure, the adding zeros are not ploted.
Len = [1:find(T{i,1}(:,1) == 0)-1]';

for j = Num_Aug*(i-1)+1:Num_Aug*i
    p2(i,j) = plot(T_Aug{j,1}(Len,Dim_Plot(1)),T_Aug{j,1}(Len,Dim_Plot(2)),'-','color',[0.80 0.80 0.80],'linewidth',2);
end

p1 = plot(T{i,1}(Len,Dim_Plot(1)),T{i,1}(Len,Dim_Plot(2)),'k-','linewidth',3);

h = legend([p1 p2(i,j)],'Original','Variation of Augmented','location','southeast');

xlabel(sprintf('Dimension %d',Dim_Plot(1))) 
ylabel(sprintf('Dimension %d',Dim_Plot(2))) 

a1=gca;
set(a1,'LineWidth',2)
set(a1,'FontSize',28)
set(a1,'Position',POS1)
set(h,'FontSize',22)

saveas(Fig, sprintf('CVAE Aug %d Dim%d%d.tiff',i,Dim_Plot));

end


% close all

toc

