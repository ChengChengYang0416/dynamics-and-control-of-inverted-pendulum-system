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
x = zeros(1, length(t)+1);
x_dot = zeros(1, length(t)+1);
x_ddot = zeros(1, length(t));
rot_ctrl = zeros(1, length(t));
tra_ctrl = zeros(1, length(t));
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
    % calculate error of angle and position
    theta_error_now = desired_theta - theta(1, i);
    theta_error_dot_now = desired_theta_dot - theta_dot(1, i);
    theta_error_accu = theta_error_accu + theta_error_now;
    theta_error_accu = error_bound(theta_error_accu, 5);
    pos_error_now = desired_x - x(1, i);
    pos_error_dot_now = desired_x_dot - x_dot(1, i);
    pos_error_accu = pos_error_accu + pos_error_now;
    pos_error_accu = error_bound(pos_error_accu, 5);
    
    % control input
    rot_ctrl(1, i) = pid_p.p*theta_error_now + pid_p.d*theta_error_dot_now + pid_p.i*theta_error_accu;
    tra_ctrl(1, i) = pid_c.p*pos_error_now + pid_c.d*pos_error_dot_now + pid_c.i*pos_error_accu;
    Fx(1, i) = rot_ctrl(1, i) + tra_ctrl(1, i);
    
    % dynamics
    theta_ddot(1, i) = (Fx(1, i)*cos(theta(1, i))-(Mc+mp)*g*sin(theta(1, i))+mp*lp*(cos(theta(1, i))*sin(theta(1, i)))*theta_dot(1, i)^2)/(mp*lp*(cos(theta(1, i)))^2-(Mc+mp)*lp);
    theta_dot(1, i+1) = theta_dot(1, i) + theta_ddot(1, i)*delta_t;
    theta(1, i+1) = theta(1, i) + theta_dot(1, i+1)*delta_t;
    x_ddot(1, i) = (Fx(1, i)+mp*lp*sin(theta(1, i))*theta_dot(1, i)^2-mp*g*cos(theta(1, i))*sin(theta(1, i)))/(Mc+mp-mp*(cos(theta(1, i)))^2);
    x_dot(1, i+1) = x_dot(1, i) + x_ddot(1, i)*delta_t;
    x(1, i+1) = x(1, i) + x_dot(1, i+1)*delta_t;
    
    if (theta > 2*pi)
        theta = theta - 2*pi;
    end
    if (theta < -2*pi)
        theta = theta + 2*pi;
    end
    
    % convert radian to degree
    theta_degree(1, i) = rad2deg(theta(1, i));
end

figure(1)
subplot(2, 1, 1);
plot(t, theta_degree(1, 1:length(t)));
subplot(2, 1, 2);
plot(t, x(1, 1:length(t)));
