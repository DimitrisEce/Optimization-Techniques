
function [vectors,fvalues,projectionvalues]=SteepestDescentProjection(f,fgradient,x0,maxiterations,e,gamma,s)

    x=x0;
    vectors=x0;
    projectionvalues=[];
    fvalues=f(x);
    gradient=fgradient(x);
    
    convergence=false;
    iterations=0;

    minimum=[-10;-8];
    maximum=[5;12];


    while iterations<maxiterations
        
        if norm(gradient)<e
            convergence=true;
            break;
        end
        
        xtemp=x-s*gradient;
        xbar=max(minimum,min(xtemp,maximum));

        x=x+gamma*(xbar-x);
        
        gradient=fgradient(x);
        vectors=[vectors,x];
        fvalues=[fvalues,f(x)];
        projectionvalues=[projectionvalues,xbar];
        iterations=iterations+1;
       
    end
  
    if convergence && iterations>0
        fprintf("The algorithm started at [%f,%f] and converged succesfully in %d iterations.\n\n",x0(1),x0(2),iterations);
    else 
        fprintf("The algorithm started at [%f,%f] and was unsuccesfull. It returned in %d iterations.\n\n",x0(1),x0(2),iterations);
    end
    
end

