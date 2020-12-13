% The is a MATLAB simulation for inverted pendulem system

close all;
init();

% simulation time
dt = 0.001;
sim_t = 50;
t = 0:dt:sim_t;

% initialize the state variables of the inverted pendulem system
X = zeros(4, length(t)+1);
X_dot = zeros(4, length(t)+1);
F = zeros(1, length(1)+1);

% initial condition
X0 = [0; 0; 0; 0];
X(:, 1) = X0;
iter = 2;

for i = dt:dt:sim_t
    
end