function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% Compute the cost of theta. Sum through each feature, then divide by the number
% of features: J = 1/m * sum(-y*log(h(x))-(1-y)log(1-h(x)))
running_sum = 0;
for index = 1:m
	h_t = sigmoid(dot(theta', X(index,:)));
	running_sum += (-y(index,:)*log(h_t) - (1-y(index,:))*log(1-h_t));
end
	
J = (1/m) * running_sum;

% Compute the partial derivatives of each parameter for the gradient
sum_term = sigmoid(X * theta) - y;

for index_j = 1:size(theta)
	for index = 1:m
		grad(index_j,:) += X(index,index_j) .* sum_term(index,:);
	end
	grad(index_j,:) = (1/m) .* grad(index_j,:);
end

% =============================================================

end
