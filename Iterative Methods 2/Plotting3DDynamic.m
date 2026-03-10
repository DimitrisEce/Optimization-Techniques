function []=Plotting3DDynamic(vectorstotal,fvaluestotal,fsymbolic,plottitle)
    
    figure;
    hold on;
    xlabel('X');
    ylabel('Y');
    zlabel('F(X,Y)');
    title(plottitle);
    

    colors={'r','k','m','c'};

    
   everyvector=[];
   everyvalue=[];

   for i=1:length(vectorstotal)
       everyvector=[everyvector,vectorstotal{i}];
       everyvalue=[everyvalue,fvaluestotal{i}];
   end
    
   xlow=min(everyvector(1,:));
   xup=max(everyvector(1,:));
   ylow=min(everyvector(2,:));
   yup=max(everyvector(2,:));
   fxup=max(everyvalue);
   fxlow=min(everyvalue);
    
   xslack=0.1*(xup-xlow);
   yslack=0.1*(yup-ylow);
   zslack=0.1*(fxup-fxlow);

   xlim([xlow-xslack,xup+xslack]);
   ylim([ylow-yslack,yup+yslack]);
   zlim([fxlow-zslack,fxup+zslack]);

   xlimits=xlim;
   ylimits=ylim;
   zlimits=zlim;
    
   fsurf(fsymbolic, [xlimits(1),xlimits(2),ylimits(1),ylimits(2)]);

   colormap jet;
   colorbar;
   view(-45, 45);

   everyx=[];
   everyy=[];
   everyz=[];

   for i=1:length(vectorstotal)
       vectors=vectorstotal{i};
       fvalues=fvaluestotal{i};

       x=vectors(1,:);
       y=vectors(2,:);
       z=fvalues;

       everyx=[everyx,x];
       everyy=[everyy,y];
       everyz=[everyz,z];


       plot3(x,y,z,'-x','Color',colors{i},'LineWidth',2,'MarkerSize',4);
   end

   outofbounds=find(everyx<xlimits(1)|everyx>xlimits(2)|everyy<ylimits(1)|everyy>ylimits(2)|everyz<zlimits(1)|everyz>zlimits(2));

   if ~isempty(outofbounds)
        plot3(everyx(outofbounds),everyy(outofbounds),everyz(outofbounds),'o','Color','k','MarkerSize',10);
        fprintf("Values were found to be outside of plotting range.\n\n");
   end



  legend('Function','Vector Convergence','Out of Bounds');
  hold off;

end