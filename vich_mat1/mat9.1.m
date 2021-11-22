for x = [1, 5, 10, 15, 20, 25, -1, -5, -10, -15, -20, -25]
(exp(x) - expon(x))/exp(x)
end 
% если считать exp(-x) как 1/exp(x) %
for x = [-1, -5, -10, -15, -20, -25]
(exp(x) - 1/expon(-x))/exp(x)
end 
function [sum] = expon(x)
sum = single(1);
term = single(x);
i=single(2);
while sum + term ~= sum
    sum = sum + term;
    term = term *x /i;
    i=i+1;
end
end
