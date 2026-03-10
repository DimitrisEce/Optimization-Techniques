
function [vectors,fvalues,gradientvalues,iterations]=SteepestDescent(f,fgradient,x0,maxiterations,e,gammamethod)

    x=x0;
    vectors=x0;
    fvalues=f(x);
    gradient=fgradient(x);
    gradientvalues=gradient;
    iterations=0;
    convergence=false;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    while iterations<maxiterations
        %%%%%%%%%%%%%%%%%%%%%%%
        if norm(gradient)<e
            convergence=true;
            break;
        end
        %%%%%%%%%%%%%%%%%%%%%%%
        d=-gradient;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        switch lower (gammamethod)
            case 'constant'
                gamma=0.182;
           
            case 'optimal'
                g=@(gamma) f(x+gamma*d);
                gamma=fminbnd(g,0,10);
            
            case 'armijo'
                s=7;
                b=0.5;
                a=0.1;
                m=0;
                gamma=s*b^m;
                while f(x)-f(x+gamma*d)<-a*gamma*(d'*gradient)
                    m=m+1;
                    gamma=s*b^m;
                end

            otherwise
                fprintf("Invalid input argument. \n\n");
                return;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        x=x+gamma*d;
        
        gradient=fgradient(x);
        vectors=[vectors,x];
        fvalues=[fvalues,f(x)];
        gradientvalues=[gradientvalues,gradient];
        iterations=iterations+1;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if convergence && iterations>0
        fprintf("Method: %s. The algorithm started at [%f,%f] and converged succesfully in %d iterations.\n\n",gammamethod,x0(1),x0(2),iterations);
    else 
        fprintf("Method: %s. The algorithm started at [%f,%f] and was unsuccesfull. It returned in %d iterations.\n\n",gammamethod,x0(1),x0(2),iterations);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

