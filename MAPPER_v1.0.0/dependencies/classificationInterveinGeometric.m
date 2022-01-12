%% Intervein classification function

function [labelledIntervein, yfit] = ClassificationInterveinGeometric(bw_label)

    %% load the trained machine learning model for intervein cassification
    % load('trainedModelGeometricFeaturesv1.mat');
    load('trainedModel.mat');

    %% Extract EFD features fro each intervein component of the Drosophila wing
    x = bw_label;
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
   
    %% Predict class of each inervein region 
    %yfit = trainedModelGeometricFeaturesv1.predictFcn(geometricFeaturesIntervein);
    yfit = trainedModel.predictFcn(geometricFeaturesIntervein);


    %% Obtain a labelled segmentation mask for output (to be printe dfor each wing)
    labelledIntervein = bw_label;
    [num_rows num_columns] = size(labelledIntervein);
    for i = 1:num_rows
        for j = 1:num_columns
            if bw_label(i,j) ~= 0
                labelledIntervein(i,j) = yfit(bw_label(i,j));
            end
        end
    end
    
end

        




 


