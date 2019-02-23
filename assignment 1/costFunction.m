function [j] = costFunction(x, y, theta)

m = size(x,1);
h=sigmoid(x*theta);

j = -(1/m)*sum(y .* log(h)+(1 - y).*log(1-h));

end
