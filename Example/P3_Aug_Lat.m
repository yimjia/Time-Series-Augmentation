%% Latent Feature Generation for Augmentation
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

mu = readmatrix(sprintf('Data_Lat%d_Epoch%d/Encode_Mu',Lat,Epoch));
logvar = readmatrix(sprintf('Data_Lat%d_Epoch%d/Encode_LogVariance',Lat,Epoch));


%% Latent Feature Generation
% Number of augmentation
Num_Aug = 100;

for i = 1:length(mu)
    for j = 1:Num_Aug
        % Control random number generation for reproducibility
        rng(1000*i^2+50*j^3+20*i*j+i)
        epsilon(i,j) = normrnd(0,1);
        Random_Raw{i,1}(j,:) = mu(i,:)+exp(logvar(i,:))*epsilon(i,j);
    end
end

Lat_Ran = cell2mat(Random_Raw);


%% Save Data
save(sprintf('Aug_Lat.mat'),'Lat_Ran','Num_Aug');


toc


