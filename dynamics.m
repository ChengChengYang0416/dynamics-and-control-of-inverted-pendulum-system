function dX = dynamics(t, X, F)
P.Mc = 2.4;
P.mp = 0.23;
P.lp = 0.36;
P.g = 9.81;

dX(1) = X(2);
dX(2) = (F+P.mp*P.lp*sin(X(3))*X(4)*X(4)-P.mp*P.g*cos(X(3))*sin(X(3)))/(P.Mc+P.mp-P.mp*cos(X(3))*cos(X(3)));
dX(3) = X(4);
dX(4) = (F*cos(X(3))+(P.Mc+P.mp)*P.g*sin(X(3))-P.mp*P.lp*X(4)*X(4)*cos(X(3))*sin(X(3)))/((P.Mc+P.mp)*P.lp-P.mp*P.lp*cos(X(3))*cos(X(3)));

dX = dX';
end