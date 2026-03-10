clc
close all;
clear all;

%Declaring the function using syms.

syms x y real

f(x,y)=x^5*exp(-x^2-y^2);

%Plotting using fsurf at the region of interest.

figure;

fsurf(f, [-7,7,-7,7]);


xlabel('X');
ylabel('Y');
zlabel('F(X,Y)');

title("Visualization of F(x) in the range of interest");

colormap jet;
colorbar;
view(-45,45);

%Calculating the critical points using the built-in solve function for
%future reference.

dfdx=diff(f,x);
dfdy=diff(f,y);

[criticalx,criticaly]=solve([dfdx==0,dfdy==0],[x,y],"Real",true);

criticalpoints=[double(criticalx),double(criticaly)];
criticalvalues=double(f(criticalx,criticaly));

fprintf("The following critical points and their values will be shown below.\n\n");

index=size(criticalpoints,1);

for i=1:index
    xi=criticalpoints(i,1);
    yi=criticalpoints(i,2);
    fi=criticalvalues(i);

    fprintf("%d) (x,y)=(%f,%f) and f(x,y)=%f \n\n",i,criticalpoints(i,1),criticalpoints(i,2),criticalvalues(i));
end
