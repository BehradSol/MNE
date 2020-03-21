%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>


clc
clear 
close all


T = 100;
Ny = 2;
Nx =  3;

R = 0.1*eye(Ny);
C = rand(Ny , Nx);
X = 10*rand(Nx,T);
Y = C*X + mvnrnd(zeros(1,Ny),R,T)';
eta = 1;

[ Xhat ] = MNE(Y, C, R, eta);

for i = 1 : Nx
    subplot(Nx,1,i)    
    plot(X(i,:),'-black')
    hold on
    plot(Xhat(i,:),'-red')
    legend('Ground truth','MNE')
    ylabel(strcat('Source #' , num2str(i)))
end

xlabel('Time')



