% Matlab Script to control Kinematics_Dynamics File
clc
close all
clear all
% Defining Initial conditions for all states

% Aircraft Velocity - U V W {X Y Z Vel in order}
u_v_w_init = [15; 0; 0;]; % m/s

% Inital Position in Body Frame {X Y Z}
x_y_z_init = [0; 0; 0;]; % m

% Inital Position in Body Frame {Pn Pe Pd}
n_e_d_init = [0; 0; 0;]; % m

% Initial Euler Rates {P Q R}
p_q_r_init = [0; 0; 0;]; % m/s

% Initial Euler Angles {Phi Theta Psi}
phi_theta_psi_init = [10; 0; 0;]; % degrees

% Defining Initial conditions for all parameters

% Forces
fx = 10; % N
fy = 2; % N
fz = 0; % N

% Moments
L = 0.1; 
M = 0;
N = 0;

% MOI
Jx = 0.1147; % kg-m^2
Jy = 0.0576; % kg-m^2
Jz = 0.1712; % kg-m^2
Jxy = 0; % kg-m^2
Jxz = 0.0015; % kg-m^2
Jyz = 0; % kg-m^2


% mass
Mass = 1.56; % kg

slx = sim('Kinematics_Dynamics');

% Plot SImulink Model Outputs
plot_signal(slx,'u_v_w')
plot_signal(slx,'phi_theta_psi')
plot_signal(slx,'X_Y_Z')
plot_signal(slx,'pn_pe_pd')


function plot_signal(out, var_name)
output = out.yout.getElement(var_name);
names = split_names(var_name);
figure("Name",var_name);
plot(output.Values)
legend(names);
grid on
end


function names = split_names(var_name)
% extract returns char array based on selected pattern, here letter paterns
% identifies groups of letters in any given string. Hence is used to
% extract variable names in graph.
names = extract(var_name,lettersPattern);
end
