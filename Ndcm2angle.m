function [Psi,Theta,Gamma] = Ndcm2angle(Cbn)
% NDCM2ANGLE 给出姿态阵，求解姿态角
Psi = atand(Cbn(1,2)/Cbn(2,2));
Theta = asind(Cbn(3,2));
Gamma = atand(-Cbn(3,1)/Cbn(3,3));

if abs(Cbn(2,2))<10e-6
    if Cbn(1,2)>0
        Psi = 90;
    else
        Psi = -90;
    end
else
    if Cbn(2,2)<0
        if Cbn(1,2)>0
            Psi = Psi+180;
        else
            Psi = Psi-180;
        end
    end
end

if Cbn(3,3)<0
    if Gamma>0
        Gamma = Gamma-180;
    else
        Gamma = Gamma+180;
    end
end
end