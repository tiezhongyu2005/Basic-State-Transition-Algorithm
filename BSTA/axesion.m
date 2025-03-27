function [Best,fBest] = axesion(funfcn,Best,fBest,SE,Range,beta,delta)
oldBest = Best;
flag = 0; 
State = op_axes(Best,SE,delta); 
State = bound(State,Range);
[newBest,fnewBest] = selection(funfcn,State);
if fnewBest < fBest
    fBest = fnewBest;
    Best = newBest;
    flag = 1;
end

if flag ==1
    State = op_translate(oldBest,newBest,SE,beta);
    State = bound(State,Range);
    [newBest,fnewBest] = selection(funfcn,State);
    if fnewBest < fBest
        fBest = fnewBest;
        Best = newBest;
    end
end
