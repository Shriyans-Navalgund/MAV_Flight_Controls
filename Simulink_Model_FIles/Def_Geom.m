function aircraft_points= Def_Geom(A)
%%
% A(1), A(2), A(3), A(4), A(5), A(6), A(7), A(8), A(9), A(10), A(11)
% Matrix A is defined as the order of Aircraft part lengths as given above
% in order of appearnace. A is 11 X 1 Matrix
%%
% Geometry Variables
aircraft_points = [
            A(9), 0, 0; % Point 1
            A(10), A(7)/2, -A(8)/2; % Point 2
            A(10), -A(7)/2, -A(8)/2; % Point 3
            A(10), -A(7)/2, A(8)/2; % Point 4
            A(10), A(7)/2, A(8)/2; % Point 5
            -A(11), 0, 0; % Point 6
            0, A(2)/2, 0; % Point 7
            -A(1), A(2)/2, 0; % Point 8
            -A(1), -A(2)/2, 0; % Point 9
            0, -A(2)/2, 0; % Point 10
            -A(11)+A(3), A(4)/2,0; % Point 11
            -A(11), A(4)/2,0; % Point 12
            -A(11), -A(4)/2,0; % Point 13
            -A(11)+A(3), -A(4)/2,0; % Point 14
            -A(11)+A(6), 0, 0; % Point 15
            -A(11), 0, -A(5); % Point 16
            ];
end