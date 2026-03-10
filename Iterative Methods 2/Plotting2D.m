function []=Plotting2D(fvaluestotal,legendlist,plottitle)
    
    figure;
    hold on;
    linestyles = {'-o', '--s', ':d','-x'};
    
    for i=1:length(fvaluestotal)
        fvalues=fvaluestotal{i};
        iterations=0:length(fvalues)-1;
        plot(iterations,fvalues,linestyles{i},'LineWidth',3,'MarkerSize',4);
    end

    plot(xlim, [0,0], 'k--', 'LineWidth', 3);

    xlabel("Number of Iterations");
    ylabel("F(X,Y)");

    title(plottitle);

    grid on;

    legend(legendlist,'Location','best');
    hold off;


end