function [x,fval,exitflag,output] = simulatedAnnealingOptimization(x0,lb,ub,MaxIterations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('simulannealbnd');
%% Modify options setting
options = optimoptions(options,'AnnealingFcn', @annealingboltz);
options = optimoptions(options,'MaxIterations', MaxIterations_Data);
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'HybridInterval', 'end');
options = optimoptions(options,'PlotFcn', {  @saplotbestf @saplottemperature @saplotx @saplotf });
[x,fval,exitflag,output] = ...
simulannealbnd(@objectiveFunction,x0,lb,ub,options);
