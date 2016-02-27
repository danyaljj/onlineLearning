function runSimulation() 
    clear all; close all; clc; 
    if 0 
        maxT = 5; 
        randomizationIter = 20; 
        regretVector = zeros(1, maxT); 
        onlineCostVector = zeros(1, maxT); 
        offlineCostVector = zeros(1, maxT); 
        for T = 1:maxT 
            totalRegret = 0; 
            totalOnlineCost = 0; 
            totalOfflineCost = 0; 
            for j = 1:randomizationIter
                [regret, onlineCost, offlineCost] = runFixedTimeSimulation(T);
                totalRegret = totalRegret + regret; 
                totalOnlineCost = totalOnlineCost + onlineCost; 
                totalOfflineCost = totalOfflineCost + offlineCost; 
            end 
            regretVector(T) = totalRegret / randomizationIter; 
            onlineCostVector(T) = totalOnlineCost / randomizationIter; 
            offlineCostVector(T) = totalOfflineCost / randomizationIter;  
        end 
        plot(regretVector)
    %     plot(onlineCostVector)
        save('tmp')
    else 
%        [regret, onlineCost, offlineCost] = runFixedTimeSimulation(10) 
        T = 3;  
        dimension = 2;  
        x = zeros(dimension, T);  
        x(:, 1) = 10*randn(dimension,1); 
        for t = 2:T 
          x(:, t) = x(:, t-1) - eta(t) * gradient(x(:, t-1)); 
        end
        x
        plot(x(2, :), x(2, :), '*')
    end 
end

function [regret, onlineCost, offlineCost] = runFixedTimeSimulation(T)
    dimension = 10;  
    x = zeros(dimension, T);  
    x(:, 1) = 1*randn(dimension,1); 
    for t = 2:T 
        disp(['t = ' num2str(t)])
        gradient(x(:, t-1))
      x(:, t) = x(:, t-1) - eta(t) * gradient(x(:, t-1)); 
    end
    x
    onlineCost = 0; 
    for t = 1:T 
        onlineCost = fun(x(:, t)); 
    end
    offlineCost = inf; 
    for t = 1:T 
        if( fun(x(:, t)) < offlineCost )
            offlineCost = fun(x(:, t)); 
        end
    end
    regret = onlineCost - offlineCost; 
end 

function out = eta(t) 
    alpha = 1/2; 
    out = 1/(t * alpha); 
end 

function out = fun(x) 
    % |x|^2 
    out = norm(x)^2; 
end 

function out = gradient(x)
    % gradient of the |x|^2 is 2x|x|
    out = 2 * x * norm(x); 
end

