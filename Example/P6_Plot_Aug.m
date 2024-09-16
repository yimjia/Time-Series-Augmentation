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


%% Figure
ID = 27;

for i = ID
Fig = figure('units','normalized','Position',[0.05 0.05 0.88 0.88]);
POS1 = [0.15 0.15 0.7 0.7];
hold on
grid on
box on

pbaspect([1 1 1])

for j = 100*(i-1)+1:100*i
    p2(i,j) = plot(T_Aug{j,1}(:,1),T_Aug{j,1}(:,2),'-','color',[0.80 0.80 0.80],'linewidth',2);
end

p1 = plot(T{i,1}(:,1),T{i,1}(:,2),'k-','linewidth',4);

h = legend([p1 p2(i,j)],'Original','Variation of Augmented','location','southeast');

xlabel('Dimension 1') 
ylabel('Dimension 2')

a1=gca;
set(a1,'LineWidth',2)
set(a1,'FontSize',28)
set(a1,'Position',POS1)
set(h,'FontSize',22)

saveas(Fig, sprintf('CVAE Aug %d.tiff',i));

end


% close all

toc

