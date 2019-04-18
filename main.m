clc;close all ; clear;
% Loading the dataset

 dataSet = readtable('data2.csv');

 dataSet = table2cell(dataSet);
% data = load('data1.txt');
 dataSet(:,8) = [];
 dataSet(:,16) = [];

x = dataSet(:, 4:19);
x = cell2mat( x );
y = dataSet(:, 3);
y = cell2mat( y );

iny k=5;

 kMeans( 5, y );
