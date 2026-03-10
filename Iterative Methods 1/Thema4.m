clc

syms x y
fsymbolic=x^5*exp(-x^2-y^2);
fgradientsymbolic=gradient(fsymbolic, [x;y]);

f=matlabFunction(fsymbolic,'Vars',{[x;y]});
fgradient=matlabFunction(fgradientsymbolic,'Vars',{[x;y]});

fhessiansymbolic = hessian(fsymbolic, [x; y]);
fhessian = matlabFunction(fhessiansymbolic, 'Vars', {[x; y]});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x01=[0;0];
x02=[-1;1];
x03=[1;-1];
e=0.00001;
maxiterations=60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors1,fvalues1,~,~]=LevMarMethod(f,fgradient,fhessian,x01,maxiterations,e,'constant');
[vectors2,fvalues2,~,~]=LevMarMethod(f,fgradient,fhessian,x02,maxiterations,e,'constant');
[vectors3,fvalues3,~,~]=LevMarMethod(f,fgradient,fhessian,x03,maxiterations,e,'constant');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors4,fvalues4,~,~]=LevMarMethod(f,fgradient,fhessian,x01,maxiterations,e,'optimal');
[vectors5,fvalues5,~,~]=LevMarMethod(f,fgradient,fhessian,x02,maxiterations,e,'optimal');
[vectors6,fvalues6,~,~]=LevMarMethod(f,fgradient,fhessian,x03,maxiterations,e,'optimal');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors7,fvalues7,~,~]=LevMarMethod(f,fgradient,fhessian,x01,maxiterations,e,'armijo');
[vectors8,fvalues8,~,~]=LevMarMethod(f,fgradient,fhessian,x02,maxiterations,e,'armijo');
[vectors9,fvalues9,~,~]=LevMarMethod(f,fgradient,fhessian,x03,maxiterations,e,'armijo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottitle1='Convergance of the Levenberg-Marquad Method starting from [0,0]';
plottitle2='Convergance of the Levenberg-Marquad Method starting from [-1,1]';
plottitle3='Convergance of the Levenberg-Marquad Method starting from [1,-1]';


Plotting2D({fvalues1,fvalues4,fvalues7},{'Constant','Optimal','Armijo'},plottitle1);
Plotting2D({fvalues2,fvalues5,fvalues8},{'Constant','Optimal','Armijo'},plottitle2);
Plotting2D({fvalues3,fvalues6,fvalues9},{'Constant','Optimal','Armijo'},plottitle3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottitle1='Convergance of the Levenberg-Marquad Method using Constant step size from each starting point.';
plottitle2='Convergance of the Levenberg-Marquad Method using Optimal step size from each starting point.';
plottitle3='Convergence the Levenberg-Marquad Method using the Armijo Rule from each starting point.';

Plotting3D({vectors1,vectors2,vectors3},{fvalues1,fvalues2,fvalues3},fsymbolic,plottitle1);
Plotting3D({vectors4,vectors5,vectors6},{fvalues4,fvalues5,fvalues6},fsymbolic,plottitle2);
Plotting3D({vectors7,vectors8,vectors9},{fvalues7,fvalues8,fvalues9},fsymbolic,plottitle3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Plotting2D({fvalues1,fvalues2,fvalues3},{'[0,0]','[-1,1]','[1,-1]'},plottitle1);
Plotting2D({fvalues4,fvalues5,fvalues6},{'[0,0]','[-1,1]','[1,-1]'},plottitle2);
Plotting2D({fvalues7,fvalues8,fvalues9},{'[0,0]','[-1,1]','[1,-1]'},plottitle3);



