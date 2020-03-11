function [ X ] = MNE(Y, C, R, eta)
    
    L = size(Y);
    T = L(1,2);
    L = size(C);
    Ny = L(1,1);
    Nx = L(1,2);
    
    WY = sqrtm(R)\Y;
    WC = sqrtm(R)\C;
    
 
    [U,D] = eig(WC*WC');

    Z = U'*WY;
    g = @(u) fFunction(Z,D,u) - eta*Ny*T; 
    gprime =@(u) fPrimeFunction(Z,D,u);

    lambda = 0;
    for i = 1 : 1000
        lambdaNew = lambda - g(lambda)/ gprime(lambda);
        lambda = lambdaNew;
    end
    
    X = (eye(Nx)/lambda + WC'*WC)\(WC'*WY);

end

function [ output ] = fFunction(Z,D,u)
    
    output = 0;
    for i = 1 : length(D)
        output = output + sum(Z(i,:).^2) / ((1+D(i,i)*u)^2);
    end

end

function [ output ] = fPrimeFunction(Z,D,u)
    
    output = 0;
    for i = 1 : length(D)
        output = output - 2*D(i,i)*sum(Z(i,:).^2) / ((1+D(i,i)*u)^3);
    end

end