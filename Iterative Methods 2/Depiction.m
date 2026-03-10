clc 
close all;
clear all;

syms x y real

f(x,y)=x^2/3+3*y^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
fsurf(f,[-10,10,-10,10]);

xlabel('x1');
ylabel('x2');
zlabel('f(x)');

title("Depiction of f(x).");
colormap jet;
colorbar;
view(-45,45);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dfdx=diff(f,x);
dfdy=diff(f,y);
gradientmagnitude=sqrt(dfdx^2+dfdy^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
fsurf(gradientmagnitude,[-10,10,-10,10]);

xlabel('x1');
ylabel('x2');
zlabel('|∇f(x)|');

title("Depiction of gradient magnitude, representing the slope steetpness of f(x).");
colormap jet;
colorbar;
view(-45,45);

