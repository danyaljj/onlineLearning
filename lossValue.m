function loss = lossValue(first, second, epsilon) 
    loss = -10000; 
    if first == 1 && second == 1
        loss = 2;  
    elseif first == 2 && second == 1
        loss = 2 + 2 * epsilon; 
    elseif first == 1 && second == 2
        loss = 2 - epsilon;
    elseif first == 2 && second == 2
        loss = 2 + epsilon;
    end
end 