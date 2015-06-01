function [p_allCasesNew, total_loss_new] ... 
    = runOneIteration(p_allCases, total_loss, eta, epsilon)
%     if T <= 0 
%         p_allCasesConcatenated = p_allCases;
%         return; 
%     end
    p_allCasesNew = []; 
    total_loss_new = []; 
    % for any initial probability 
    for i = 1:size(p_allCases,2); 
        %disp(['size of initial probabilities : ' num2str(size(p_allCases,2)) ])
        p = p_allCases(:,i);
        lossSoFar = total_loss(:,i); 
        % for any action pairs 
        for first = 1:2
            for second = 1:2 
               loss = lossValue(first, second, epsilon); 
               p_allCasesNew(:, end+1) = updateExp3(p, eta, ...
                   loss, second); 
               total_loss_new(:, end+1) = lossSoFar + loss;  
           end 
        end   
    end
end 