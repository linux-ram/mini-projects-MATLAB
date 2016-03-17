%Olympic Logo

r=0.45;
Center={[-1 0],[0 0],[1 0],[-0.5 -0.5],[0.5 -0.5]};
Color={'b','k','r','y','g'};
for i=1:5
[x,y]=getCircle(Center{i},r);
plot(x,y,Color{i},'LineWidth',3)
hold on
end
axis([-1.5 1.5 -1.2 1.2])