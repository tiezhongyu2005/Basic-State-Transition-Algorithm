clear all
clc
currentFolder = pwd;
addpath(genpath(currentFolder))
% parameter setting
warning('off')
SE =  30; % sample size
n = 100;% dimension
Range = repmat([-5.12;5.12],1,n);%lower and upper bound
maxIter = 2e3;% maximum number of iterations
funfcn = 'Rastrigin';
tic
[Best,fBest] = STA(funfcn,SE,Range,maxIter);
toc