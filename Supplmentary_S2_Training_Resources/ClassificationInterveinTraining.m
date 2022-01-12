%% Author: Nilay Kumar, University of Notre Dame

%% MAPPER- Training the intervein classifier
% The commented portion of the code was first used to generate a training
% data. We then used MATLAB's classification learner app to train a
% classifier on the training data. The classifier uses basic geometrical
% features extracted using regionprops for each individual intervein
% region.

%% Preparing workspace

clear all;
clc;

%% Adding directories containing the training data
% 1NormalPixelLabelData - Contains training data for seven intervein 
% cmpatments of a normal looking wing 
% 2ACVPixelLabelData - ACV defect
% 3PCVPixelLabelData - PCV defect
% 4ACVPCVPixelLabelData - Both ACV nad PCV defect
% 5ACVEndDefectPixelLabelData - ACV nad end defect
% Refer SI figure- for label and definition

addpath(genpath('trainingDataInterveinClassifier'))
addpath('dependenciesInterveinClassifierGeometric')

%% Getting list of images in each directory containing training data
% dirtraininglabels%i% = directory containing labelled images  
% traininglist%i% structure with elements filename and folder location of files.
% traininglistname%i% = name of files structure

dirtraininglabels1 = ['trainingDataInterveinClassifier/1NormalPixelLabelData' filesep];
traininglist1 = dir([dirtraininglabels1 '*.png']);
traininglistname1 = {traininglist1.name};

dirtraininglabels2 = ['trainingDataInterveinClassifier/2ACVPixelLabelData' filesep];
traininglist2 = dir([dirtraininglabels2 '*.png']);
traininglistname2 = {traininglist2.name};

dirtraininglabels3 = ['trainingDataInterveinClassifier/3PCVPixelLabelData' filesep];
traininglist3 = dir([dirtraininglabels3 '*.png']);
traininglistname3 = {traininglist3.name};

dirtraininglabels4 = ['trainingDataInterveinClassifier/4ACVPCVPixelLabelData' filesep];
traininglist4 = dir([dirtraininglabels4 '*.png']);
traininglistname4 = {traininglist4.name};

dirtraininglabels5 = ['trainingDataInterveinClassifier/5ACVEndDefectPixelLabelData' filesep];
traininglist5 = dir([dirtraininglabels5 '*.png']);
traininglistname5 = {traininglist5.name};

%% Looping over training data containing normal looking wing image with 7 intervein regions

for i = 1:length(traininglistname1)
    filename = [];
    % Getting path for the file
    dummy = traininglist1.folder;
    % Appending with filename
    filename = strcat(dummy,'\',traininglistname1{i});
    x = imread(filename);
    % Declaring empty variable names
    geometricFeaturesIntervein = [];
    featureArea = [];
    featureEccentricity = [];
    featureMajor = [];
    featureMinor = [];
    featureRatio =  [];
    % Using regionprops to extract different geometric features
    stats = regionprops(x,'Area','Eccentricity','MajorAxisLength','MinorAxisLength');
    featureArea =  cat(1,stats.Area);
    featureEccentricity = cat(1,stats.Eccentricity);
    featureMajor = cat(1,stats.MajorAxisLength);
    featureMinor = cat(1,stats.MinorAxisLength);
    % Aspect ratio of each intervein region
    featureRatio =  featureMajor ./ featureMinor;
    % Intervein area normalized with overall wing area
    featureArea = featureArea / sum(featureArea);
    % Storing feature of each wing in the variable named geometricFeaturesIntervein
    geometricFeaturesIntervein(:,1) = featureArea;
    geometricFeaturesIntervein(:,2) = featureEccentricity;
    geometricFeaturesIntervein(:,3) = featureRatio;
    % Storing the feature of each wing in the variable named feature 1.
    % Feature 1 loops over and has features from all the wing  in the
    % specified folder
    features1(7*(i-1)+1:7*i,:) = geometricFeaturesIntervein;
    Labels1(7*(i-1)+1:7*i, 1) = [1,2,3,4,5,6,7]';
end

%%  Looping over training data containing wing images with ACV defects (6 intervein regions)

for i = 1:length(traininglistname2)
    filename = [];
    dummy = traininglist2.folder;
    filename = strcat(dummy,'\',traininglistname2{i});
    x = imread(filename);
    geometricFeaturesIntervein = [];
    featureArea = [];
    featureEccentricity = [];
    featureMajor = [];
    featureMinor = [];
    featureRatio =  [];
    stats = regionprops(x,'Area','Eccentricity','MajorAxisLength','MinorAxisLength');
    featureArea =  cat(1,stats.Area);
    featureEccentricity = cat(1,stats.Eccentricity);
    featureMajor = cat(1,stats.MajorAxisLength);
    featureMinor = cat(1,stats.MinorAxisLength);
    featureRatio =  featureMajor ./ featureMinor;
    featureArea = featureArea / sum(featureArea);
    geometricFeaturesIntervein(:,1) = featureArea;
    geometricFeaturesIntervein(:,2) = featureEccentricity;
    geometricFeaturesIntervein(:,3) = featureRatio;
    features2(6*(i-1)+1:6*i,:) = geometricFeaturesIntervein;
    Labels2(6*(i-1)+1:6*i, 1) = [1,2,8,5,6,7]';
end

%%  Looping over training data containing wing images with ACV defects (6 intervein regions)

for i = 1:length(traininglistname3)
    filename = [];
    dummy = traininglist3.folder;
    filename = strcat(dummy,'\',traininglistname3{i});
    x = imread(filename);
    geometricFeaturesIntervein = [];
    featureArea = [];
    featureEccentricity = [];
    featureMajor = [];
    featureMinor = [];
    featureRatio =  [];
    stats = regionprops(x,'Area','Eccentricity','MajorAxisLength','MinorAxisLength');
    featureArea =  cat(1,stats.Area);
    featureEccentricity = cat(1,stats.Eccentricity);
    featureMajor = cat(1,stats.MajorAxisLength);
    featureMinor = cat(1,stats.MinorAxisLength);
    featureRatio =  featureMajor ./ featureMinor;
    featureArea = featureArea / sum(featureArea);
    geometricFeaturesIntervein(:,1) = featureArea;
    geometricFeaturesIntervein(:,2) = featureEccentricity;
    geometricFeaturesIntervein(:,3) = featureRatio;
    features3(6*(i-1)+1:6*i,:) = geometricFeaturesIntervein;
    Labels3(6*(i-1)+1:6*i, 1) = [1,2,3,4,9,7]';
end

%%  Looping over training data containing wing images with both ACV and PCV defects (5 intervein regions)

for i = 1:length(traininglistname4)
    filename = [];
    dummy = traininglist4.folder;
    filename = strcat(dummy,'\',traininglistname4{i});
    x = imread(filename);
    geometricFeaturesIntervein = [];
    featureArea = [];
    featureEccentricity = [];
    featureMajor = [];
    featureMinor = [];
    featureRatio =  [];
    stats = regionprops(x,'Area','Eccentricity','MajorAxisLength','MinorAxisLength');
    featureArea =  cat(1,stats.Area);
    featureEccentricity = cat(1,stats.Eccentricity);
    featureMajor = cat(1,stats.MajorAxisLength);
    featureMinor = cat(1,stats.MinorAxisLength);
    featureRatio =  featureMajor ./ featureMinor;
    featureArea = featureArea / sum(featureArea);
    geometricFeaturesIntervein(:,1) = featureArea;
    geometricFeaturesIntervein(:,2) = featureEccentricity;
    geometricFeaturesIntervein(:,3) = featureRatio;
    features4(5*(i-1)+1:5*i,:) = geometricFeaturesIntervein;
    Labels4(5*(i-1)+1:5*i, 1) = [1,2,8,9,7]';
    
end

%%  Looping over training data containing wing images with ACV defects and L5 end defect (6 intervein regions)

for i = 1:length(traininglistname5)
    filename = [];
    dummy = traininglist5.folder;
    filename = strcat(dummy,'\',traininglistname5{i});
    x = imread(filename);
    geometricFeaturesIntervein = [];
    featureArea = [];
    featureEccentricity = [];
    featureMajor = [];
    featureMinor = [];
    featureRatio =  [];
    stats = regionprops(x,'Area','Eccentricity','MajorAxisLength','MinorAxisLength');
    featureArea =  cat(1,stats.Area);
    featureEccentricity = cat(1,stats.Eccentricity);
    featureMajor = cat(1,stats.MajorAxisLength);
    featureMinor = cat(1,stats.MinorAxisLength);
    featureRatio =  featureMajor ./ featureMinor;
    featureArea = featureArea / sum(featureArea);
    geometricFeaturesIntervein(:,1) = featureArea;
    geometricFeaturesIntervein(:,2) = featureEccentricity;
    geometricFeaturesIntervein(:,3) = featureRatio;
    features5(5*(i-1)+1:5*i,:) = geometricFeaturesIntervein;
    Labels5(5*(i-1)+1:5*i, 1) = [1,2,8,5,10]';
end

%% Appending all the training data

trainingDataSet = vertcat(features1,features2,features3,features4,features5);
ResponseTraining = vertcat(Labels1,Labels2,Labels3,Labels4,Labels5);


%% Visualization of training data 
C = linspecer(10);
gscatter3b(trainingDataSet(:,1),trainingDataSet(:,2),trainingDataSet(:,3),ResponseTraining,C)




