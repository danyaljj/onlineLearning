% finds the average regret over a game with 'T' many rounds. 
% The final regret is repeated and averaged over 'repeatition' many
% times. 
function regret = simulateRandomForGivenT(T, repetition)
% repetition = 100;
epsilon = 0.99;
k = 2;
eta = sqrt(2 * log(k) / (T * k));

total_loss = 0;
for repeat = 1:repetition
    % uniform initialization
    p(1) = rand();
    p(2) = 1-p(1);
    for t = 1:2:T
        first = (rand() < p(2)) + 1;
        second = (rand() < p(2)) + 1;
        loss = lossValue(first, second, epsilon);
        p = updateExp3(p, eta, loss, second);
        %         p
        total_loss = total_loss + loss;
        %         disp(['first = ' num2str(first) ' / second = ' num2str(second) ...
        %             ' / loss ' num2str(loss) ' / total_loss = ' num2str(total_loss) ])
    end
%     p
end
total_loss = total_loss / repetition;
diff = p(2) - p(1);
bestHindSight = (diff > 0) + 1;
% disp(['average total loss = ' num2str(total_loss)]);
loss_best_hindsight = lossValue(bestHindSight, bestHindSight, epsilon) * T/2;
% disp(['loss_best_hindsight = ' num2str(loss_best_hindsight)]);
regret = total_loss - loss_best_hindsight;
% disp(['Regret = ' num2str(regret)]);