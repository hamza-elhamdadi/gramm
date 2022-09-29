clc;
clearvars;
load example_data;


%g(1,1)=gramm('x',cars.Model_Year,'y',cars.MPG,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5);
%g(1,1).stat_violin();

%cars.Origin = cars.Origin(1:10)
%cars.MPG = cars.MPG(1:10)
%cars.Cylinders = cars.Cylinders(1:10)


clear g
%{
g=gramm('x',(cars.Horsepower-nanmean(cars.Horsepower))/nanstd(cars.Horsepower),'y',-(cars.Acceleration-nanmean(cars.Acceleration))/nanstd(cars.Acceleration),'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5);
g.geom_point();
g.stat_cornerhist('edges',-4:0.2:4,'aspect',0.6);
g.geom_abline();
g.set_title('stat_cornerhist()');
g.set_names('x','z(Horsepower)','y','-z(Acceleration)');
g.draw();
%}
g(1,1)=gramm('x',cars.Origin_Region,'y',cars.MPG,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5 & cars.Cylinders~=8);
g(1,2)=gramm('x',cars.Origin_Region,'y',cars.MPG,'color',cars.Cylinders,'subset',cars.Cylinders~=3 & cars.Cylinders~=5 & cars.Cylinders~=8);
g(1,1).stat_beeswarm('alpha',0.75);
g(1,2).geom_point('alpha',0.75)%.stat_violin('fill','transparent');

g.draw();
