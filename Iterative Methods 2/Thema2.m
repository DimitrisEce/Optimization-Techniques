clc

syms x y
fsymbolic=(x^2)/3+3*y^2;
fgradientsymbolic=gradient(fsymbolic, [x;y]);

f=matlabFunction(fsymbolic,'Vars',{[x;y]});
fgradient=matlabFunction(fgradientsymbolic,'Vars',{[x;y]});


[vectors,fvalues,projectionvalues]=SteepestDescentProjection(f,fgradient,[5;-5],100,0.01,0.5,5);

plottitle1="Convergence of f(x) starting at [5 -5], gamma=0.5, s=5";

Plotting2D({fvalues},{'s=5,gamma=0.5'},plottitle1);

Plotting3D({vectors},{fvalues},fsymbolic,plottitle1);

%disp(vectors);
%disp(projectionvalues);