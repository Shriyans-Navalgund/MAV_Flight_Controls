% Coordinate Frames

aircraft_points = def_geom(2, 20, 1, 6, 1.5, 1.5, 1.5, 1.5, 4, 2, 15);
% Draw aircraft initial position
draw_aircraft(aircraft_points)

% setting angles to be rotated to
phi = 0;
theta = 10;
psi = 0;
set_angles(phi,theta,psi);
NED_r = rotate(aircraft_points',phi, theta, psi);
% Drawing rotated aircraft
draw_aircraft(NED_r')

% Translating Aircraft by given distance
NED_t = translate(NED_r,0,10,0);
% Drawing translated aircraft
draw_aircraft(NED_t')

function aircraft_points= def_geom(wing_l, wing_w, tailH_l, tailH_w, tailV_l, tailV_w, fuse_w, fuse_h, fuse_l1, fuse_l2, fuse_l3)
% Geometry Variables desribing all 16 points on the aircraft
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
            -fuse_l3, 0, -tailV_l; % Point 16
            ];
end

function draw_aircraft(aircraft_points)
% Defines surfaces made up of 3 points on the aircraft
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
% Defines surfaces made up of 4 points on the aircraft
aircraft_faces4 = [
            7 8 9 10; % Wing
            11 12 13 14; % Horizontal Tail
            2 3 4 5; % Nose-Fuselage
            ];
% ptach function stitches the faces together to make a 3-D object
patch('Faces', aircraft_faces3,'Vertices', aircraft_points,'FaceColor', 'red')
patch('Faces', aircraft_faces4,'Vertices', aircraft_points,'FaceColor', 'blue')
xlabel("X-Label")
ylabel("Y-Label")
zlabel("Z-Label")
set(gca,"ZDir",'reverse')
axis equal
grid on
end

function  set_angles(phi, theta, psi)
global angles
angles = [phi;theta;psi];
end

function Euler_angles = get_angles()
global angles
if isempty(angles)
    Euler_angles= [0 0 0];
else
    Euler_angles = angles;
end
end

function XYZ = rotate(XYZ, phi, theta, psi)
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
XYZ = (R*XYZ);
set_angles(phi,theta,psi);
end

function XYZ = translate(NED, pn,pe,pd)
A = get_angles();
phi = A(1);
theta = A(2);
psi = A(3);
move = rotate([pn;pe;pd],phi, theta, psi);
XYZ = NED + move;
end