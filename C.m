function [value] = C(x) 
%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL), 
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: C_ex1_2.m
%--------------------------------------------------------------------------
% Description: Flow set
% Return 0 if outside of C, and 1 if inside C
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also plotflows, plotHarc, plotHarcColor, plotHarcColor3D,
%   plotHybridArc, plotjumps.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

global taubar

x1 = x(1);
x2 = x(2);

if (x1 <= taubar) || (x2 <= taubar)
    value = 1;
else
    value = 0;
end
end