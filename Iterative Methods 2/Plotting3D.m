function []=Plotting3D(vectorstotal,fvaluestotal,fsymbolic,plottitle)
    
    figure;
    fsurf(fsymbolic, [-10, 10, -10, 10]);
    hold on;
    xlabel('X');
    ylabel('Y');
    zlabel('F(X,Y)');
    title(plottitle);
    colormap jet;
    colorbar;
    view(-45, 45);

    colors={'r','k','m','c'};

    
    for i=1:length(vectorstotal)
        vectors=vectorstotal{i};
        fvalues=fvaluestotal{i};
        for j=1:size(vectors,2)
            for k=1:size(vectors,1)
                if vectors(k,j)>100
                    vectors(k,j)=100;
                    fprintf("Vector values were out of bounds and were clipped for display purposes.");
                    fprintf("The values depicted do not correspond to real values.\n\n");
                elseif vectors(k,j)<-100
                    vectors(k,j)=-100;
                    fprintf("Vector values were out of bounds and were clipped for display purposes.");
                    fprintf("The values depicted do not correspond to real values.\n\n");
                end
            end
        end
        for j=1:length(fvalues)
            if fvalues(j)>300
                fvalues(j)=300;
                fprintf("f(x) values were out of bounds and were clipped for display purposes.");
                fprintf("The values depicted do not correspond to real values.\n\n");
            elseif fvalues(j)<-300
                fprintf("f(x) values were out of bounds and were clipped for display purposes.");
                fprintf("The values depicted do not correspond to real values.\n\n");
                fvalues(j)=-300;
            end
        end
        x=vectors(1,:);
        y=vectors(2,:);
        z=fvalues;
        plot3(x,y,z,'-x','Color',colors{i},'LineWidth',2,'MarkerSize',5);
    end

    legend('Function','Vector Convergence')
    hold off;

end