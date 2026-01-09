% Load prepared data

clear; clc;

trainFolder = fullfile("dataset", "train");
testFolder  = fullfile("dataset", "test");

% AlexNet input size
inputSize = [227 227 3];

% Load training images
imdsTrain = imageDatastore(trainFolder, ...
    "IncludeSubfolders", true, ...
    "LabelSource", "foldernames");

% Load testing images
imdsTest = imageDatastore(testFolder, ...
    "IncludeSubfolders", true, ...
    "LabelSource", "foldernames");

fprintf("Training images: %d\n", numel(imdsTrain.Files));
fprintf("Testing images : %d\n", numel(imdsTest.Files));

% Resize images for AlexNet
augTrain = augmentedImageDatastore(inputSize, imdsTrain);
augTest  = augmentedImageDatastore(inputSize, imdsTest);


% Save stored data
save("Stored_data.mat", "augTrain", "augTest", "imdsTrain", "imdsTest");

fprintf("Stored data loaded\n");
