% The is a MATLAB simulation for inverted pendulem system
close all;
init();

% simulation time
dt = 0.01;
sim_t = 10;
t = 0:dt:sim_t;
t = t';

% desired states
Xd = [0.5; 0; 0; 0];

% initialize the state variables of the inverted pendulem system
X = zeros(4, length(t));
F = zeros(1, length(t));

% initial condition
X0   = [0; 0; 10*pi/180; 0];
X(:, 1) = X0;
iter = 2;

% save the errors of the states
eX = zeros(2, length(t));
eX_dot = zeros(2, length(t));
eX_int = zeros(2, length(t));

for i = dt:dt:sim_t
    eX(1, iter) = Xd(1) - X(1, iter-1);
    eX_dot(1, iter)  = (eX(1, iter) - eX(1, iter-1))/dt;
    eX_int(1, iter)  = eX_int(1, iter-1) + eX(1, iter)*dt;

    eX(2, iter)      = Xd(3) - X(3, iter-1);
    eX_dot(2, iter)  = (eX(2, iter) - eX(2, iter-1))/dt;
    eX_int(2, iter)  = eX_int(2, iter-1) + eX(2, iter)*dt;

    F(iter) = -(pid_c.p*eX(1, iter) + pid_c.d*eX_dot(1, iter) + pid_c.i*eX_int(1, iter))...
                + (pid_p.p*eX(2, iter) + pid_p.d*eX_dot(2, iter) + pid_p.i*eX_int(2, iter));

    [T, X_new] = ode45(@(t, x) dynamics(t, x, F(iter)), [0, dt], X(:, iter-1)', F(iter));
    X(:, iter) = X_new(end,:)';
    iter = iter + 1;
end

% plot
plotter(t, X, Xd)
