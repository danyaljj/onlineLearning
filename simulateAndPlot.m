clear all; close all; clc; 

regretAll = []; 
T_all = 5:500; 
for T = T_all
%   regretAll(end+1) = simulateRandomForGivenT(T, 200);
    regretAll(end+1) = simulateRandomForGivenT_KentSuggestion(T, 200, log(T)); 
end
figure
plot(T_all, regretAll)
