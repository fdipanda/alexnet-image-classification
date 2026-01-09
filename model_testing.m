%  Running AlexNet on test data

clear; clc;

% Load test data
load("Stored_data.mat", "augTest", "imdsTest");
trueLabels = imdsTest.Labels;

% Load the two selected models
load("trainedModel_config_8.mat", "trainedNet");
net8 = trainedNet;

load("trainedModel_config_12.mat", "trainedNet");
net12 = trainedNet;


% Predictions for both models
pred8  = classify(net8, augTest);
pred12 = classify(net12, augTest);


% Accuracies
acc8  = mean(pred8  == trueLabels);
acc12 = mean(pred12 == trueLabels);

fprintf("\nAccuracy (Config 8):  %.4f\n", acc8);
fprintf("Accuracy (Config 12): %.4f\n", acc12);

% Confusion matrices
cm8  = confusionmat(trueLabels, pred8);
cm12 = confusionmat(trueLabels, pred12);

fprintf("\nConfusion Matrix - Config 8:\n");
disp(cm8);

fprintf("\nConfusion Matrix - Config 12:\n");
disp(cm12);

% Sensitivity and Specificity

sens8 = cm8(1,1)  / sum(cm8(1,:));
spec8 = cm8(2,2)  / sum(cm8(2,:));

sens12 = cm12(1,1) / sum(cm12(1,:));
spec12 = cm12(2,2) / sum(cm12(2,:));

fprintf("\nSensitivity / Specificity:\n");
fprintf("Config 8  - Sensitivity: %.4f | Specificity: %.4f\n", sens8,  spec8);
fprintf("Config 12 - Sensitivity: %.4f | Specificity: %.4f\n", sens12, spec12);

% Plots
figure;
plotconfusion(trueLabels, pred8);
title("Confusion Matrix – Config 8");
saveas(gcf, "Confmat_Config8.png");

figure;
plotconfusion(trueLabels, pred12);
title("Confusion Matrix – Config 12");
saveas(gcf, "Confmat_Config12.png");


fprintf("\nConfusion matrices saved.\n");
