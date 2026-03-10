clc

syms x y
fsymbolic=x^5*exp(-x^2-y^2);
fgradientsymbolic=gradient(fsymbolic, [x;y]);

f=matlabFunction(fsymbolic,'Vars',{[x;y]});
fgradient=matlabFunction(fgradientsymbolic,'Vars',{[x;y]});

fhessiansymbolic = hessian(fsymbolic, [x; y]);
fhessian = matlabFunction(fhessiansymbolic, 'Vars', {[x; y]});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x01=[-1;1];
x02=[1;-1];
e=0.00001;
maxiterations=100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors1,fvalues1,~,~]=SteepestDescent(f,fgradient,x01,maxiterations,e,'optimal');
[vectors2,fvalues2,~,~]=SteepestDescent(f,fgradient,x02,maxiterations,e,'optimal');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors3,fvalues3,~,~]=LevMarMethod(f,fgradient,fhessian,x01,maxiterations,e,'optimal');
[vectors4,fvalues4,~,~]=LevMarMethod(f,fgradient,fhessian,x02,maxiterations,e,'optimal');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottitle1='Steepest Descent vs Levenberg-Marquad Methods starting from [-1,1] using the Optimal strategy.';

Plotting2D({fvalues1,fvalues3},{'Steepest Descent','Levenberg-Marquad'},plottitle1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottitle2='Steepest Descent vs Levenberg-Marquad Methods starting from [1,-1] using the Optimal strategy.';

Plotting2D({fvalues2,fvalues4},{'Steepest Descent','Levenberg-Marquad'},plottitle2);