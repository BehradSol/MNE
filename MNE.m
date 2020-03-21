%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [ X ] = MNE(Y, C, R, eta)
    
    % y        = observation matrix with dimension Ny * T
    % C        = linear mapping (lead-field matrix) with dimension Ny * Nx
    % R (opt.) = observation noise covariance matrix with dimension Ny * Ny
    %            (default = identity matrix)
    % eta      = noise threshold 
    %            (default = 1)

    L = size(Y);
    T = L(1,2);
    L = size(C);
    Ny = L(1,1);
    Nx = L(1,2);
    
        
    if nargin < 4
        eta = 1;
    end
    
    if nargin < 3
        R = eye(Ny);
    end

    % Whitening the data
    WY = sqrtm(R)\Y;
    WC = sqrtm(R)\C;
    
    % Eigenvalue decomposition of C*C'
    [U,D] = eig(WC*WC');

    Z = U'*WY;
    g = @(u) fFunction(Z,D,u) - eta*Ny*T; 
    gprime =@(u) fPrimeFunction(Z,D,u);

    % Utilizing Newton's method to obtain lambda
    lambda = 0;
    for i = 1 : 1000
        lambdaNew = lambda - g(lambda)/ gprime(lambda);
        lambda = lambdaNew;
    end
    
    % Computing the MNE solution
    X = (eye(Nx)/lambda + WC'*WC)\(WC'*WY);

end

% This function computes the function f(.)
function [ output ] = fFunction(Z,D,u)
    
    output = 0;
    for i = 1 : length(D)
        output = output + sum(Z(i,:).^2) / ((1+D(i,i)*u)^2);
    end

end

% This function computes the derivative of f(.)
function [ output ] = fPrimeFunction(Z,D,u)
    
    output = 0;
    for i = 1 : length(D)
        output = output - 2*D(i,i)*sum(Z(i,:).^2) / ((1+D(i,i)*u)^3);
    end

end