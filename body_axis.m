function body_axis(lamda,L,R)
% BODY_AXIS 用来绘图，将机体坐标系在地球表面展现
% lamda 经度
% L 纬度
% R 地球半径

% 2017年12月25日 徐长申编
%{
%quiver3(X,Y,Z,U,V,W)参数均为同样大小的矩阵,更详细应用参见help quiver3。
%参数 2 用来指定矢量长度为2； 'filled'填充； 线宽
% 'k'为黑色==> x轴； 'b'为蓝色==>z轴； 'g'为绿色==>y轴
%}

%画一个球体代表地球earth
[e_x,e_y,e_z] = sphere(20);
mesh(R*e_x,R*e_y,R*e_z);
hold on

%4. 用分量来画，定点变为地球表面上一点。
%地球坐标系e：% x轴为 [1 0 0]'; y轴为[0 1 0]'; z轴为[0 0 1]' 
quiver3(0,0,0,1,0,0,R+2,'k','filled','LineWidth',2);
hold on
quiver3(0,0,0,0,1,0,R+2,'g','filled','LineWidth',2);
hold on
quiver3(0,0,0,0,0,1,R+2,'b','filled','LineWidth',2);
hold on
%变换阵C_eg：姿态即求得
C_eg = [-sin(lamda) cos(lamda) 0; -sin(L)*cos(lamda) -sin(lamda)*sin(L) cos(L); cos(L)*cos(lamda) cos(L)*sin(lamda) sin(L)];
C_eg = inv(C_eg);
%提取变换后坐标： % x轴为 [C_eg(1,1) C_eg(2,1) C_eg(3,1)]' y,z类似
%计算 机体位置                        
[b_x,b_y,b_z] = sph2cart(lamda,L,R);

quiver3(b_x,b_y,b_z,C_eg(1,1),C_eg(2,1),C_eg(3,1),2,'k','filled','LineWidth',2);
hold on
quiver3(b_x,b_y,b_z,C_eg(1,2),C_eg(2,2),C_eg(3,2),2,'g','filled','LineWidth',2);
hold on 
quiver3(b_x,b_y,b_z,C_eg(1,3),C_eg(2,3),C_eg(3,3),2,'b','filled','LineWidth',2);
axis equal
title('e系到g系坐标变换');   
xlabel('X轴');      
ylabel('Y轴');      
zlabel('Z轴');         
view(90+lamda*90/pi,30) %视点
hold off

%3. 实现给定 经度lamda、纬度L，地球坐标系e到地理坐标系g的变换--变换矩阵为 C_eg
%缺陷，未能在箭头上标注x,y,z；以颜色代替
%{
X = zeros(3,1);
Y = X;
Z = X;
U = [1 0 0]';
V = [0 1 0]';
W = [0 0 1]';
quiver3(X,Y,Z,U,V,W,2,'k','filled','LineWidth',2);
hold on

lamda = pi/4;
L = pi/4;
C_eg = [-sin(lamda) cos(lamda) 0; -sin(L)*cos(lamda) -sin(lamda)*sin(L) cos(L); cos(L)*cos(lamda) cos(L)*sin(lamda) sin(L)];
U_g = C_eg*U;
V_g = C_eg*V;
W_g = C_eg*W;
quiver3(X,Y,Z,U_g,V_g,W_g,2,'b','filled','LineWidth',2);
hold off
%}
%2. 此为矩阵表示下的画法
%{
X = zeros(3,1);
Y = X;
Z = X;
U = [1 0 0]';
V = [0 1 0]';
W = [0 0 1]';
quiver3(X,Y,Z,U,V,W,2,'k','filled','LineWidth',2);
%}
%1. 此为官方quiver3例程
%{
[x,y] = meshgrid(-2:.2:2,-1:.15:1);
z = x.*exp(-x.^2-y.^2);
[u,v,w] = surfnorm(x,y,z);
quiver3(x,y,z,u,v,w);
hold on
surf(x,y,z)
hold off
%}