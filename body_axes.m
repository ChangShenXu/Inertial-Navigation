function C_nb = body_axes(Psi,Theta,Gamma)
% BODY_AXES 给出姿态信息，求得导航坐标系到机体坐标系的坐标转移矩阵
% Psi 航向角 绕Z轴 !!要求均为弧度 Radian
% Theta 俯仰角 绕Y轴
% Gamma 横滚角 绕X轴

% 2017-12-27 徐长申 编（P252）

C_n1 = [cos(Psi) -sin(Psi) 0; sin(Psi) cos(Psi) 0; 0 0 1];
C_12 = [1 0 0; 0 cos(Theta) sin(Theta); 0 -sin(Theta) cos(Theta)];
C_2b = [cos(Gamma) 0 -sin(Gamma); 0 1 0; sin(Gamma) 0 cos(Gamma)];
C_nb = C_2b*C_12*C_n1;