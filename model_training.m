% Train AlexNet using all training configurations

clear; clc;


% Load datastores, modified layers, and training configurations
load("Stored_data.mat", "augTrain", "augTest", "imdsTrain", "imdsTest");
load("modifiedAlexNet.mat", "layers");
load("trainingConfigs.mat", "trainingConfigs");

numConfigs = length(trainingConfigs);
results = struct();


for i = 1:numConfigs

    fprintf("Training configuration %d of %d...\n", i, numConfigs);
    fprintf("LR=%g | Batch=%d | Epochs=%d\n", ...
            trainingConfigs(i).LearnRate, ...
            trainingConfigs(i).BatchSize, ...
            trainingConfigs(i).Epochs);

    % Extract training options
    opts = trainingConfigs(i).Options;

    % Train the network
    trainedNet = trainNetwork(augTrain, layers, opts);

    % Evaluate
    predictedLabels = classify(trainedNet, augTest);
    trueLabels = imdsTest.Labels;

    accuracy = mean(predictedLabels == trueLabels);

    % Confusion matrix
    cm = confusionmat(trueLabels, predictedLabels);

    % Sensitivity 
    sensitivity = cm(1,1) / sum(cm(1,:));

    % Specificity 
    specificity = cm(2,2) / sum(cm(2,:));


    % Store results
    results(i).LearnRate   = trainingConfigs(i).LearnRate;
    results(i).BatchSize   = trainingConfigs(i).BatchSize;
    results(i).Epochs      = trainingConfigs(i).Epochs;
    results(i).Accuracy    = accuracy;
    results(i).Sensitivity = sensitivity;
    results(i).Specificity = specificity;
    results(i).ConfMat     = cm;

    % Save trained model
    modelName = sprintf("trainedModel_config_%d.mat", i);
    save(modelName, "trainedNet");

    fprintf("Config %d -> Accuracy: %.4f | Sensitivity: %.4f | Specificity: %.4f\n", ...
            i, accuracy, sensitivity, specificity);

end

save("results.mat", "results");

fprintf("\nAll models trained and evaluated.\n");
