% The is a MATLAB simulation for inverted pendulem system

close all;
init();

% simulation time
delta_t = 0.001;
sim_t = 50;
t = 0:delta_t:sim_t;

% initialize the state variables of the inverted pendulem system
theta = zeros(2, length(t)+1);
theta_dot = zeros(2, length(t)+1);
theta_ddot = zeros(2, length(t));
x =zeros(2, length(t)+1);
x_dot = zeros(2, length(t)+1);
x_ddot = zeros(2, length(t));
Fx = zeros(2, length(t));
theta_degree = zeros(2, length(t)+1);
theta_error_now = zeros(2, 1);
theta_error_accu = zeros(2, 1);
