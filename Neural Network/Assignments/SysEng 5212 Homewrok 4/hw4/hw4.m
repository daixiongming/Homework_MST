%% Initialization
clear ; close all; clc

%%
x_train = loadMNISTImages('train-images.idx3-ubyte');
y_train = loadMNISTLabels('train-labels.idx1-ubyte');

%% =========== Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%
x_train = x_train';
% Load Training Data
fprintf('Loading and Visualizing Data ...\n')


m = size(x_train, 1);

% Randomly select 100 data points to display
sel = randperm(size(x_train, 1));
sel = sel(1:100); %随机产生的数据

displayData(x_train(sel, :));

%% =========== Part 1: Understand the data =============

% Note: Should include dimensionality check, normalization and splitting of
% data into training, validation and test.

%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%

%% =========== Part 2: Design a model =============
%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%
%% =========== Part 3: Train the model =============
%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%
%% =========== Part 4: Tune the model =============
%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%
%% =========== Part 5: Test the model =============
%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%
%% =========== Part 6: Present final model =============
%%%%% Type your code here %%%%%%

%%%%%%% End of your code %%%%%%%
