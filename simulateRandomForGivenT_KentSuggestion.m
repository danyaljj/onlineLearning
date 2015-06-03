% here is how bandit works. There are two actions 1 and 2. 
% the cost of action 1 is 1, and the cost of action 2 is 0. 
% whenever the action 1 is done, the feedback is not observed and are 
% stacked in memroy. We stack the feedbacks of action 1 in memory untill 
% we do one action 2 and we spit out everything in the stack (or we reach 
% to a limit, whihc is an input parameter. ) 
function regret = simulateRandomForGivenT_KentSuggestion(T, repetition, stackLimit)
k = 2; 
eta = sqrt(2 * log(k) / (T * k));

total_loss = 0;
for repeat = 1:repetition
    % uniform initialization
    p(1) = 0.5; % rand()
    p(2) = 1-p(1);
    stack = 0; 
    loss = 0;
    for t = 1:T
        action = (rand() < p(2)) + 1;
        if action == 1
            if stack < stackLimit 
                stack = stack + 1;
                loss = 0; 
            else
                % stack is not changed 
                loss = 1;
            end
        else 
            loss = stack; 
            stack = 0; 
        end 
        %loss = loss * 0.001; 
        p = updateExp3(p, eta, loss, action);
        %         p
        total_loss = total_loss + loss;
        %         disp(['first = ' num2str(first) ' / second = ' num2str(second) ...
        %             ' / loss ' num2str(loss) ' / total_loss = ' num2str(total_loss) ])
    end
%     p
end
total_loss = total_loss / repetition;
% disp(['average total loss = ' num2str(total_loss)]);
% disp(['loss_best_hindsight = ' num2str(loss_best_hindsight)]);
regret = total_loss;
% disp(['Regret = ' num2str(regret)]);