clear all; close all; clc; 

regretAll = []; 
T_all = 6:2:300; 
for T = T_all
   regretAll(end+1) = simulateRandomForGivenT(T, 200);
end
figure
plot(T_all, regretAll)
