function xplus = g(x)
%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL), 
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: g_ex1_2.m
%--------------------------------------------------------------------------
% Project: Simulation of a hybrid system (bouncing ball)
% Description: Jump map
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also plotflows, plotHarc, plotHarcColor, plotHarcColor3D,
%   plotHybridArc, plotjumps.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

global k gamma taubar

% state
x1 = x(1);
x2 = x(2);

x1plus = x1;
x2plus = x2;
if (x1 >= taubar) 
    x1plus = 0;
    x2plus = fmincon(@(x2) optFunction(x2,x1plus),0,[],[],[],[],[],[],@(u) optConstraintsJump(x2,x1plus));
    % saturate solutions
    % x2
    if x2plus >= x2 * (1 + gamma)
        x2plus = x2 * (1 + gamma);
    elseif x2plus <= x2 * (1 - gamma)
        x2plus = x2 * (1 - gamma);
    end
elseif (x2 >= taubar)
    x2plus = 0;
    x1plus = fmincon(@(x1) optFunction(x1,x2plus),0,[],[],[],[],[],[],@(u) optConstraintsJump(x1,x2plus));
    % saturate solutions
    % x1
    if x1plus >= x1 * (1 + gamma)
        x1plus = x1 * (1 + gamma);
    elseif x1plus <= x1 * (1 - gamma)
        x1plus = x1 * (1 - gamma);
    end
end


xplus = [x1plus; x2plus];
end

function out = optFunction(x1,x2)
    global k
    out = min(abs(x2-x1+k),abs(x2-x1-k));
end

function [c,ceq] = optConstraintsJump(x1,x2)
    c = [-x2; -x1; x2 - 1; x1 - 1];  % keep solution in range
    ceq = [];
end