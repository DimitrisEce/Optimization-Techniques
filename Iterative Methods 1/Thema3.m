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
maxiterations=55;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x01,maxiterations,e,'constant');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x02,maxiterations,e,'constant');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x03,maxiterations,e,'constant');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x01,maxiterations,e,'optimal');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x02,maxiterations,e,'optimal');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x03,maxiterations,e,'optimal');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x01,maxiterations,e,'armijo');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x02,maxiterations,e,'armijo');
[~,~,~,~]=NewtonsMethod(f,fgradient,fhessian,x03,maxiterations,e,'armijo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Code showcase, starting from a valid point.

x04=[-1.5735; 0.1667];

[vectors1,fvalues1,~,~]=NewtonsMethod(f,fgradient,fhessian,x04,maxiterations,e,'constant');
[vectors2,fvalues2,~,~]=NewtonsMethod(f,fgradient,fhessian,x04,maxiterations,e,'optimal');
[vectors3,fvalues3,~,~]=NewtonsMethod(f,fgradient,fhessian,x04,maxiterations,e,'armijo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottitle1='Convergence of Newton`s Method starting from [-1.5735,0.1667].';

Plotting2D({fvalues1,fvalues2,fvalues3},{'Constant','Optimal','Armijo'},plottitle1);
Plotting3D({vectors1,vectors2,vectors3},{fvalues1,fvalues2,fvalues3},fsymbolic,plottitle1);




