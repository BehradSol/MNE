clc
clear 
close all


T = 50;
Ny = 2;
Nx = 2;

R = eye(Ny);
C = rand(Ny , Nx);
X = 100*rand(Nx,T);
Y = C*X + mvnrnd(zeros(1,Ny),R,T)';


[ Xhat ] = MNE(Y, C, R, 1);


plot(X(1,:))
hold on
plot(Xhat(1,:))

figure

plot(X(2,:))
hold on
plot(Xhat(2,:))
