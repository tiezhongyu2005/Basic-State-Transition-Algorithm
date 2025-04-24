function [Best,fBest,histfBest] = STA(funfcn,n,Range,maxIter)
% parameter setting
alpha_max = 1; alpha_min = 1e-4; alpha = alpha_max;
beta = 1; gamma = 1; delta = 1; fc = 2; SE = 30;
% initialization
Best = initialization(Range,n); fBest = feval(funfcn,Best);

% iterations
histfBest = zeros(maxIter,1);
for iter = 1:maxIter
    if alpha < alpha_min
        alpha = alpha_max;
    end

    [Best,fBest] = expansion(funfcn,Best,fBest,SE,Range,beta,gamma);
    
    [Best,fBest] = rotation(funfcn,Best,fBest,SE,Range,alpha,beta);
    
    [Best,fBest] = axesion(funfcn,Best,fBest,SE,Range,beta,delta);

    fprintf('iter=%d,  ObjVal=%g\n',iter,fBest);
    histfBest(iter) = fBest;
    alpha = alpha/fc;
end



