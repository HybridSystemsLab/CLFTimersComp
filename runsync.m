%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL), 
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: run_ex1_2.m
%--------------------------------------------------------------------------
% Project: Simulation of a hybrid system (bouncing ball)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also plotflows, plotHarc, plotHarcColor, plotHarcColor3D,
%   plotHybridArc, plotjumps.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

% initial conditions
x1_0 = 0.6;
x2_0 = 0.3;
x0 = [x1_0;x2_0];

% parameters
global taubar k gamma
taubar = 1;
k = 0;
%gamma = 0.95;
gamma = 0.8;

% simulation horizon
TSPAN=[0 25];
JSPAN = [0 100];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1e-2,'MaxStep',.1);

% simulate
[t,j,x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

% plot solution vs time
figure(1) % position
clf
plotflows(t,j,x(:,1));
hold on
plotflows(t,j,x(:,2));
grid on
ylabel('x2 velocity')
axis([0 5 -0.01 1.01])
box on

if gamma == 0.95
    print -depsc -tiff -r300 NeuronsCLF-Sync2 % for gamma = 0.95
elseif gamma == 0.8
    print -depsc -tiff -r300 NeuronsCLF-Sync1 % for gamma = 0.8
end

% plot phase plane
figure(2) % position
clf
plotHarcColor(x(:,1),j,x(:,2),t);
xlabel('x1')
ylabel('x2')
grid on
axis([0 1 0 1])
box on

