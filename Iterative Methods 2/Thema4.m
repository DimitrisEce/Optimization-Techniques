clc

syms x y
fsymbolic=(x^2)/3+3*y^2;
fgradientsymbolic=gradient(fsymbolic, [x;y]);

f=matlabFunction(fsymbolic,'Vars',{[x;y]});
fgradient=matlabFunction(fgradientsymbolic,'Vars',{[x;y]});


[vectors,fvalues,projectionvalues]=SteepestDescentProjection(f,fgradient,[8;-10],1000,0.01,0.2,0.1);

plottitle1="Convergence of f(x) for the given conditions.";

Plotting2D({fvalues},{'s=0.1,gamma=0.2'},plottitle1);

Plotting3D({vectors},{fvalues},fsymbolic,plottitle1);

%disp(vectors);
%disp(projectionvalues);