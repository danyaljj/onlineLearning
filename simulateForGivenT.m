function simulateForGivenT(T)
epsilon = 0.01; 
k = 2; 
eta = sqrt(2 * log(k) / (T * k));

% uniform initialization 
p_per_iteration = {}; 
p(1,1) = 0.5; 
p(2,1) = 0.5; 
total_loss = [0, 0]; 
% for t = 1:2:T 
%     [p, total_loss] = reportRecursiveResults(p, total_loss, eta, epsilon); 
% end 

diff = p(2,:) - p(1,:);
bestHindSight = (diff > 0) + 1;  
disp(['total cases = ' num2str(size(p,2))]); 
disp(['total action 1 chosen = ' num2str(sum(bestHindSight==1))]); 
disp(['total action 2 chosen = ' num2str(sum(bestHindSight==2))]); 
%min_total_loss_hindsight = ones(size(bestHindSight)); 
for i = 1:length(bestHindSight)
    min_total_loss_hindsight(i) = lossValue(bestHindSight(i), bestHindSight(i), epsilon) * T/2;  
end
regret = total_loss - min_total_loss_hindsight; 
averageRegret = mean(regret);
%disp(['Regret = ' num2str(regret)]); 