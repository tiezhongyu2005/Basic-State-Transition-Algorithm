function [Best,fBest] = expansion(funfcn,Best,fBest,SE,Range,beta,gamma)
oldBest = Best;
flag = 0; 
State = op_expand(Best,SE,gamma); 
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



