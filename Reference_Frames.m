% Coordinate Frames

% aircraft_lengths = [2 20 1 6 1.5 1.5 1.5 1.5 4 2 15];
aircraft_points = def_geom(2, 20, 1, 6, 1.5, 1.5, 1.5, 1.5, 4, 2, 15);
draw_aircraft(NED_2_XYZ(aircraft_points))
XYZ_r = rotate(NED_2_XYZ(aircraft_points), 0,45,0);
XYZ_f = NED_2_XYZ(XYZ_r);
draw_aircraft(XYZ_f)

function aircraft_points= def_geom(wing_l, wing_w, tailH_l, tailH_w, tailV_l, tailV_w, fuse_w, fuse_h, fuse_l1, fuse_l2, fuse_l3)
% Geometry Variables
aircraft_points = [
            fuse_l1, 0, 0; % Point 1
            fuse_l2, fuse_w/2, -fuse_h/2; % Point 2
            fuse_l2, -fuse_w/2, -fuse_h/2; % Point 3
            fuse_l2, -fuse_w/2, fuse_h/2; % Point 4
            fuse_l2, fuse_w/2, fuse_h/2; % Point 5
            -fuse_l3, 0, 0; % Point 6
            0, wing_w/2, 0; % Point 7
            -wing_l, wing_w/2, 0; % Point 8
            -wing_l, -wing_w/2, 0; % Point 9
            0, -wing_w/2, 0; % Point 10
            -fuse_l3+tailH_l, tailH_w/2,0; % Point 11
            -fuse_l3, tailH_w/2,0; % Point 12
            -fuse_l3, -tailH_w/2,0; % Point 13
            -fuse_l3+tailH_l, -tailH_w/2,0; % Point 14
            -fuse_l3+tailV_w, 0, 0; % Point 15
            -fuse_l3+tailV_w, 0, -tailV_l; % Point 16
            ];
end


function draw_aircraft(aircraft_points)

aircraft_faces3 = [
            1 2 3; % Nose
            1 2 5; % Nose
            1 4 5; % Nose
            1 3 4; % Nose
            2 3 6; % Fuselage
            3 4 6; % Fuselage
            4 5 6; % Fuselage
            2 5 6; % Fuselage
            15 16 6; % Vertical Tail
            ];
aircraft_faces4 = [
            7 8 9 10; % Wing
            11 12 13 14; % Horizontal Tail
            2 3 4 5; % Nose-Fuselage
            ];

hold on
patch('Faces', aircraft_faces3,'Vertices', aircraft_points,'FaceColor', 'red')
patch('Faces', aircraft_faces4,'Vertices', aircraft_points,'FaceColor', 'blue')
axis equal
grid on
end

function XYZ = NED_2_XYZ(XYZ)
 
 R = [
            -1 0 0;
            0 -1 0;
            0 0 1;
     ];
 XYZ = XYZ*R;
end
function XYZ = rotate(XYZ, phi, theta, psi)
XYZ = XYZ';
R_roll = [
            1 0 0;
            0 cos(phi) -sin(phi);
            0 -sin(phi) cos(phi);
            ];

R_pitch = [
            cos(theta) 0 -sin(theta);
            0 1 0;
            sin(theta) 0 cos(theta);
            ];

R_yaw = [
            cos(psi) sin(psi) 0;
            -sin(psi) cos(psi) 0;
            0 0 1;
            ];
R = R_roll*R_pitch*R_yaw;
XYZ = (R*XYZ)';
end
