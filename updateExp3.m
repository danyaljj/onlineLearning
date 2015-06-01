function p_new = updateExp3(p, eta, loss, actionIndex)
    p_new = p; 
%     size(p_new)
%     save('tmp')
    p_new(actionIndex) = p(actionIndex) * exp(  - eta * loss / p(actionIndex) ); 
    p_new = p_new / sum(p_new); 
end 