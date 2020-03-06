function [ X ] = MNE(yy, CC, R)
    
    T = length(yy);
    L = size(CC);
    Ny = L(1,1);
    Nx = L(1,2);
    
    y = sqrtm(R)\yy;
    C = sqrtm(R)\CC;
    
 
    [U,D] = eig(C*C');

    Z = U'*y;
    g = @(u) fFunction(Z,D,u) - Ny*T; 
    gprime =@(u) fPrimeFunction(Z,D,u);

    u = 0;
    for i = 1 : 1000
        uNew = u - g(u)/ gprime(u);
        u = uNew;
    end
    
    X = (eye(Nx)/u + C'*C)\(C'*y);

end

