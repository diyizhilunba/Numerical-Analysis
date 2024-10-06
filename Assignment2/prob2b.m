%% Question b
% define the functions
f1 = @(x1,x2) 5*x1 + x1.*x2.^2 + cos(3*x2).^2 - 1;
f2 = @(x1,x2) exp(2*x1-x2)+4*sin(x2) - 2;
% define the domain
x = linspace(-1,1,30);
[X,Y] = meshgrid(x);% create a meshgrid with on the domain
figure(1);
mesh(X,Y,f1(X,Y),'FaceAlpha','0.5','FaceColor','red'); 
% create a red semitransparent 3d mesh plot with z = f1
hold on;
mesh(X,Y,f2(X,Y),'FaceAlpha','0.5','FaceColor','green');
% create a green semitransparent 3d mesh plot with z = f2
mesh(X,Y,zeros(size(X)),'FaceAlpha','0.5','FaceColor','blue');
% create a blue semitransparent 3d mesh plot with z = 0
xlabel('x'); ylabel('y'); zlabel('z');
% label the three axis as x,y,z
hold off

