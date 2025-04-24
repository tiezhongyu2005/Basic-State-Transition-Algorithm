clear all             % Clear all variables
clc                   % Clear the command window
currentFolder = pwd;  % Get the current working directory
addpath(genpath(currentFolder)) % Add current directory and all subfolders
warning('off')        % Disable warnings

% Parameter setting
funfcn = @Rastrigin;  % Function handle
n = 100;              % Dimensionality (number of variables)
Range = repmat([-5.12;5.12], 1, n); % Search space range
maxIter = 2e3;        % Maximum number of iterations

tic                  % Start timing
[Best, fBest] = STA(funfcn, n, Range, maxIter); % Call the STA
toc                  % Stop timing
