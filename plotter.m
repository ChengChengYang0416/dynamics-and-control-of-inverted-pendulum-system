function plotter(t, X, Xd)

% plot the states
figure(1)
subplot(4, 1, 1)
plot(t, X(1, :), 'Linewidth', 2)
grid on
yline(Xd(1), 'm', 'LineWidth', 2);
y = ylabel('$X$ $(m)$', 'Interpreter', 'latex', 'rotation', 0);
set(y, 'Units', 'Normalized', 'Position', [-0.09, 0.41])
legend('$X$', '$X_{d}$', 'Interpreter', 'latex')
title('States')
subplot(4, 1, 2)
plot(t, X(2, :), 'Linewidth', 2)
grid on
yline(Xd(2), 'm', 'LineWidth', 2);
y = ylabel('$\dot{X}$ $(m/s)$', 'Interpreter', 'latex', 'rotation', 0);
set(y, 'Units', 'Normalized', 'Position', [-0.09, 0.41])
legend('$\dot{X}$', '$\dot{X_d}$', 'Interpreter', 'latex')
subplot(4, 1, 3)
plot(t, X(3, :)*180/pi, 'Linewidth', 2)
grid on
yline(Xd(3), 'm', 'LineWidth', 2);
y = ylabel('$\theta$ $(^{o})$', 'Interpreter', 'latex', 'rotation', 0);
set(y, 'Units', 'Normalized', 'Position', [-0.09, 0.41])
legend('$\theta$', '$\theta_{d}$', 'Interpreter', 'latex')
subplot(4, 1, 4)
plot(t, X(4, :)*180/pi, 'Linewidth', 2)
grid on
yline(Xd(4), 'm', 'LineWidth', 2);
y = ylabel('$\dot{\theta}$ $(^{o}/s)$', 'Interpreter', 'latex', 'rotation', 0);
set(y, 'Units', 'Normalized', 'Position', [-0.09, 0.41])
legend('$\dot{\theta}$', '$\dot{\theta_d}$', 'Interpreter', 'latex')
xlabel('Time(sec)')

end