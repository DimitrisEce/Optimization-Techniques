function []=Plotting3D(vectorstotal,fvaluestotal,fsymbolic,plottitle)
    
    figure;
    fsurf(fsymbolic, [-7, 7, -7, 7]);
    hold on;
    xlabel('X');
    ylabel('Y');
    zlabel('F(X,Y)');
    title(plottitle);
    colormap jet;
    colorbar;
    view(-45, 45);

    colors={'r','k','m'};

    for i=1:length(vectorstotal)
        vectors=vectorstotal{i};
        fvalues=fvaluestotal{i};
        x=vectors(1,:);
        y=vectors(2,:);
        z=fvalues;
        plot3(x,y,z,'-x','Color',colors{i},'LineWidth',2,'MarkerSize',5);
    end

    legend('Function','Vector Convergence')
    hold off;

end