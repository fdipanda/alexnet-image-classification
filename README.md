# alexnet-image-classification
A MATLAB-based image classification pipeline using transfer learning with AlexNet, including dataset preparation, model training, and evaluation.

## Overview
This project implements an **image classification pipeline using deep learning** in MATLAB.  
It leverages **AlexNet** and transfer learning to train and evaluate a convolutional neural network on an image dataset.

The pipeline is structured to clearly separate dataset preparation, model configuration, training, and evaluation.

## Technologies Used
- **Language:** MATLAB
- **Domain:** Deep Learning / Computer Vision
- **Model:** AlexNet (transfer learning)
- **Framework:** MATLAB Deep Learning Toolbox

## Project Structure
- `src/`
  - `dataset_load.m` – Loads the image dataset
  - `dataset_prepare.m` – Preprocesses and organizes images
  - `training_setup.m` – Configures training parameters
  - `alexnet_conversion.m` – Adapts AlexNet for the target task
  - `model_training.m` – Trains the CNN model
  - `model_testing.m` – Evaluates model performance

## How It Works
1. Images are loaded and organized into training and test sets
2. AlexNet is adapted using transfer learning
3. Training parameters are configured
4. The model is trained on the dataset
5. Model performance is evaluated on unseen data

## How to Run
Execute the scripts in the following order:
```matlab
dataset_load
dataset_prepare
training_setup
alexnet_conversion
model_training
model_testing
```

Intermediate `.mat` files generated during execution are not tracked in the repository.

## Academic Context
This project was developed to practice:
- Deep learning with convolutional neural networks
- Transfer learning using AlexNet
- Image classification workflows in MATLAB
- Model training and evaluation

## Author
Franck Dipanda
