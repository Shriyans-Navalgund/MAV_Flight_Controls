function Draw_Aircraft(aircraft_points)

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

patch('Faces', aircraft_faces3,'Vertices', aircraft_points,'FaceColor', 'red')
patch('Faces', aircraft_faces4,'Vertices', aircraft_points,'FaceColor', 'blue')
xlabel("X-Label")
ylabel("Y-Label")
zlabel("Z-Label")
set(gca,"ZDir",'reverse')
axis equal
grid on
end