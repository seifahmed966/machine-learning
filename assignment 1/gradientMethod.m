function [theta, j] = gradientMethod(x, y, theta, alpha, iterations)

m = length(y); % number of training examples
j = zeros(iterations, 1);

for i = 1:iterations

    h = x * theta;
    theta(1) =theta(1)- alpha*(1/m)*sum(h-y);
    theta(2) =theta(2)- alpha*(1/m)*sum((h-y).*x(:,2));
    theta(3) =theta(3)- alpha*(1/m)*sum((h-y).*x(:,3));
        
    j(i) = costFunction(x,y,theta);

end

end