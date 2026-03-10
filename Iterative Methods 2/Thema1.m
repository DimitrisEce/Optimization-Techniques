clc

syms x y
fsymbolic=(x^2)/3+3*y^2;
fgradientsymbolic=gradient(fsymbolic, [x;y]);

f=matlabFunction(fsymbolic,'Vars',{[x;y]});
fgradient=matlabFunction(fgradientsymbolic,'Vars',{[x;y]});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[vectors1,fvalues1,~,~]=SteepestDescent(f,fgradient,[2;1],120,0.001,'constant',0.1);
[vectors2,fvalues2,~,~]=SteepestDescent(f,fgradient,[2;1],45,0.001,'constant',0.3);
[vectors3,fvalues3,~,~]=SteepestDescent(f,fgradient,[2;1],5,0.001,'constant',3);
[vectors4,fvalues4,~,~]=SteepestDescent(f,fgradient,[2;1],5,0.001,'constant',5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

legendlist1={'gamma=0.1','gamma=0.3'};
legendlist2={'gamma=3','gamma=5'};
fvaluestotal1={fvalues1,fvalues2};
fvaluestotal2={fvalues3,fvalues4};
plottitle1="Convergence of the Steepest Descent method from [2,1] using different succesfull step values";
plottitle2="Convergence of the Steepest Descent method from [2,1] using different unsuccesfull step values";

Plotting2D(fvaluestotal1,legendlist1,plottitle1);
Plotting2D(fvaluestotal2,legendlist2,plottitle2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vectorstotal1={vectors1,vectors2};
vectorstotal2={vectors3,vectors4};

Plotting3D(vectorstotal1,fvaluestotal1,fsymbolic,plottitle1);
Plotting3DDynamic(vectorstotal2,fvaluestotal2,fsymbolic,plottitle2);

