% @Laboratory:   Object Recognition
% @Subject:      Computer Vision
% @Professor:    Santi Seguí
% @Students:     Pablo Martínez and Aleix Solanes

%% Day 1 and 2: Digit Classification with Support Vector Machines
close all; clear all; clc;
addpath('svmdemo/');

load('mnist_all.mat');
imshow(reshape(train3(5,:),28,28)');
%% Train a SVM with 100 random samples per class and a linear kernel(you can
% use a different C soft margin parameters: 0.01, 0.1, 1, 2, 4).

C = [0.01,0.1,1,2,4];
clear('train_sets');
% first, we get the names of the different test and train sets
train_sets = who('train*');
test_sets = who('test*');

[model, train_x] = train_svm(100,C);

%train_svm