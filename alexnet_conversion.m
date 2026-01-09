% Load and modify AlexNet for DR and nonDR classification

clear; clc;

% Load pretrained AlexNet
net = alexnet;
layers = net.Layers;

% Display original architecture size for reference
fprintf("Original AlexNet output layer size: %d classes\n", numel(layers(end).Classes));

% Modify the last 3 layers:
% Replace the fullyConnectedLayer(1000) with fullyConnectedLayer(2)
% Replace softmax & classification layers accordingly

numClasses = 2;

layers(end-2) = fullyConnectedLayer(numClasses, ...
    "Name", "fc_final", ...
    "WeightLearnRateFactor", 10, ...
    "BiasLearnRateFactor", 10);

layers(end-1) = softmaxLayer("Name", "softmax");
layers(end)   = classificationLayer("Name", "classoutput");

% Save modified layers for training step
save("modifiedAlexNet.mat", "layers");

fprintf("AlexNet modified for %d classes.\n", numClasses);

% referenced Matlab guide and chatgpt to better understand transferlearning
% implementation: https://www.mathworks.com/help/deeplearning/ug/transfer-learning-using-alexnet.html