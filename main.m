% The is a MATLAB simulation for inverted pendulem system

close all;
init();

% simulation time
dt = 0.001;
sim_t = 50;
t = 0:dt:sim_t;

% desired states
Xd = [0.1; 0; 0; 0];

% initialize the state variables of the inverted pendulem system
X = zeros(4, length(t)+1);
X_dot = zeros(4, length(t)+1);
F = zeros(1, length(1)+1);

% initial condition
X0 = [0; 0; 0; 0];
X(:, 1) = X0;
iter = 2;

% save the errors of the states
eX = zeros(2, length(t)+1);
eX_dot = zeros(2, length(t)+1);
eX_int = zeros(2, length(t)+1);

for i = dt:dt:sim_t
    eX(1, iter) = Xd(1) - X(1, iter);
    eX_dot(1, iter) = (eX(1, iter) - eX(1, iter - 1))/dt;
    eX_int(1, iter) = eX_int(1, iter-1) + eX(1, iter)*dt;

    eX(2, iter) = Xd(3) - X(3, iter);
    eX_dot(2, iter) = (eX(2, iter) - eX(2, iter - 1))/dt;
    eX_int(2, iter) = eX_int(2, iter-1) + eX(2, iter)*dt;

    F(1, iter) = -(pid_c.p*eX(1, iter)+pid_c.d*eX_dot(1, iter)+pid_c.i*eX_int(1, iter)) ...
                    + (pid_p.p*eX(2, iter)+pid_p.d*eX_dot(2, iter)+pid_p.i*eX_int(2, iter));
    iter = iter + 1;
end