clear all; clc;
load('features1.mat');
load('features2.mat');
load('features3.mat');
load('features4.mat');
load('features5.mat');
load('Labels1.mat')
load('Labels2.mat')
load('Labels3.mat')
load('Labels4.mat')
load('Labels5.mat')

trainingDataSet = vertcat(features1,features2,features3,features4,features5)
ResponseTraining = vertcat(Labels1,Labels2,Labels3,Labels4,Labels5)

Y = tsne(trainingDataSet);
gscatter(Y(:,1),Y(:,2),ResponseTraining)

