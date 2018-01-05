function Cnb = Nangle2dcm(Psi,Theta,Gamma)
% NANGLE2DCM 给出姿态角，求解姿态矩阵
% 三次基本旋转 Psi-->Theta-->Gamma
Cn1 = [cos(Psi) -sin(Psi) 0
        sin(Psi) cos(Psi) 0
         0         0      1];
C12 = [ 1     0          0
        0 cos(Theta) sin(Theta)
        0 -sin(Theta) cos(Theta)];     
C2b = [cos(Gamma) 0 -sin(Gamma)
        0         1      0
        sin(Gamma) 0 cos(Gamma)];
Cnb = C2b*C12*Cn1;    
end