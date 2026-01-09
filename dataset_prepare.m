% Prepare dataset 
clear; clc;

rootFolder = '/Users/franckalexis/Documents/MATLAB/Assignment3/DS_IDRID';
trainSrc = fullfile(rootFolder, "Train");
testSrc  = fullfile(rootFolder, "Test");

baseOut = "dataset";
outTrain_DR    = fullfile(baseOut, "train", "DR");
outTrain_NonDR = fullfile(baseOut, "train", "NonDR");

outTest_DR     = fullfile(baseOut, "test", "DR");
outTest_NonDR  = fullfile(baseOut, "test", "NonDR");

% Creating output folders
folders = {outTrain_DR, outTrain_NonDR, outTest_DR, outTest_NonDR};

for i = 1:length(folders)
    if ~exist(folders{i}, "dir")
        mkdir(folders{i});
    end
end

% Processing training images
trainFiles = dir(fullfile(trainSrc, "*.jpg"));

for i = 1:numel(trainFiles)

    filename = trainFiles(i).name;
    src = fullfile(trainFiles(i).folder, filename);

    % Extract labels from file name 
    parts = split(filename, "-");
    labelStr = erase(parts{end}, ".jpg");
    label = str2double(labelStr);

    % Skip labels 1 and 2
    if label == 1 || label == 2
        continue;
    end

    if label == 0
        dest = fullfile(outTrain_NonDR, filename);
    elseif label == 3 || label == 4
        dest = fullfile(outTrain_DR, filename);
    else
        fprintf("Unknown Train label %d in %s\n", label, filename);
        continue;
    end

    copyfile(src, dest);
end

% Processing Test Images
testFiles = dir(fullfile(testSrc, "*.jpg"));
for i = 1:numel(testFiles)

    filename = testFiles(i).name;
    src = fullfile(testFiles(i).folder, filename);

    % Extract label
    parts = split(filename, "-");
    labelStr = erase(parts{end}, ".jpg");
    label = str2double(labelStr);

    % Skip labels 1 and 2
    if label == 1 || label == 2
        continue;
    end

    if label == 0
        dest = fullfile(outTest_NonDR, filename);
    elseif label == 3 || label == 4
        dest = fullfile(outTest_DR, filename);
    else
        fprintf("Unknown Test label %d in %s\n", label, filename);
        continue;
    end

    copyfile(src, dest);
end

fprintf("\nDataset preparation complete\n");
