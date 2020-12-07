% The is a MATLAB simulation for inverted pendulem system

close all;
init();

% simulation time
delta_t = 0.001;
sim_t = 50;
t = 0:delta_t:sim_t;

% initialize the state variables of the inverted pendulem system
theta = zeros(1, length(t)+1);
theta_dot = zeros(1, length(t)+1);
theta_ddot = zeros(1, length(t));
x =zeros(1, length(t)+1);
x_dot = zeros(1, length(t)+1);
x_ddot = zeros(1, length(t));
Fx = zeros(1, length(t));
theta_degree = zeros(1, length(t)+1);
theta_error_now = zeros(1, 1);
theta_error_accu = zeros(1, 1);
pos_error_now = zeros(1, 1);
pos_error_accu = zeros(1, 1);

% desired position and angle
desired_theta = 0.0;
desired_theta_dot = 0.0;
desired_x = 0.1;
desired_x_dot = 0.0;

% simulation start
for i = 1:length(t)
    
end
