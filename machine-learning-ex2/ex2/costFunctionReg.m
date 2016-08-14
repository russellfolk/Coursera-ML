function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% Compute the cost of theta. Sum through each feature, then divide by the number
% of features: J = 1/m * sum(-y*log(h(x))-(1-y)log(1-h(x)))
running_sum = 0;
for index = 1:m
	h_t = sigmoid(dot(theta', X(index,:)));
	running_sum += (-y(index,:)*log(h_t) - (1-y(index,:))*log(1-h_t));
end


% for regularization, do not regularize theta_0 (in Octave, theta_1)
regularized_sum = 0;
for index = 2:size(theta)
	regularized_sum += theta(index,:) .^ 2;
end
	
J = (1/m) * running_sum + (lambda/(2*m)) * regularized_sum;

% Compute the partial derivatives of each parameter for the gradient
% remember to regularize the gradient for theta > 0 (in Octave, theta > 1)
sum_term = sigmoid(X * theta) - y;

for index_j = 1:size(theta)
	for index = 1:m
		grad(index_j,:) += X(index,index_j) .* sum_term(index,:);
	end
	grad(index_j,:) = (1/m) .* grad(index_j,:);
	if (index_j > 1)
		grad(index_j,:) += (lambda/m) * theta(index_j);
	end
end

% =============================================================

end
