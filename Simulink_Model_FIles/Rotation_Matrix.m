function XYZ = Rotation_Matrix(XYZ_orignal, phi, theta, psi)
R_roll = [1 0 0;
          0 cosd(phi) sind(phi);
          0 -sind(phi) cosd(phi);];

R_pitch = [cosd(theta) 0 -sind(theta);
           0 1 0;
           sind(theta) 0 cosd(theta);];

R_yaw = [cosd(psi) sind(psi) 0;
         -sind(psi) cosd(psi) 0;
         0 0 1;];

R = R_roll*R_pitch*R_yaw;
XYZ = (R*XYZ_orignal);
% set_angles(phi,theta,psi);
end