%% Augmented Data Generation
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

[Len, Dim] = size(T{1});


%% Augmented Data
Aug = readmatrix(sprintf('Data_Lat%d_Epoch%d_Aug/Aug',Lat,Epoch));

% Reshape
for i = 1:length(Aug(:,1))
    T_Aug{i,1} = reshape(Aug(i,:),Dim,Len)';
end


%% Save Data
save(sprintf('Aug_TimeSeries.mat'),'T_Aug');


toc


