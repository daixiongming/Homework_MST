clc
clear all
close all
%%
 %load('data1.mat');
load('data2.mat');

%% Design SVM
% Type your code here and save your architecture under tha name 'model'




%% Plot the data
pos = find(y == 1); neg = find(y == 0);
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 1, 'MarkerSize', 7)
hold on;
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
hold off;
x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';
x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)';
[X1, X2] = meshgrid(x1plot, x2plot);
vals = zeros(size(X1));
for i = 1:size(X1, 2)
   this_X = [X1(:, i), X2(:, i)];
   vals(:, i) = predict(model, this_X);
end

% Plot the SVM boundary
hold on
contour(X1, X2, vals);
hold off;



