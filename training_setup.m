% Define Training Options 

clear; clc;


% Load the modified AlexNet layers
load("modifiedAlexNet.mat", "layers");


% Hyperparameter ranges
learningRates = [1e-3, 1e-4, 1e-5];
batchSizes    = [16, 32];
epochCounts   = [5, 10];

% Create all combinations
configIndex = 1;
trainingConfigs = struct();

for lr = learningRates
    for bs = batchSizes
        for ep = epochCounts

            opts = trainingOptions("sgdm", ...
                "InitialLearnRate", lr, ...
                "MiniBatchSize", bs, ...
                "MaxEpochs", ep, ...
                "Shuffle", "every-epoch", ...
                "Verbose", true, ...
                "Plots", "none", ...     
                "ExecutionEnvironment", "auto");

            trainingConfigs(configIndex).LearnRate = lr;
            trainingConfigs(configIndex).BatchSize = bs;
            trainingConfigs(configIndex).Epochs    = ep;
            trainingConfigs(configIndex).Options   = opts;

            configIndex = configIndex + 1;
        end
    end
end


save("trainingConfigs.mat", "trainingConfigs", "layers");

fprintf("\n%d training configurations created.\n", length(trainingConfigs));

% referenced Matlab guide and chatgpt to better understand transferlearning
% implementation: https://www.mathworks.com/help/deeplearning/ug/transfer-learning-using-alexnet.html