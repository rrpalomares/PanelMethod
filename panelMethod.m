%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                     SOURCE PANEL METHOD SOLVER
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;
Vinf = 1;
alpha = 0;

gridSize = 10; % assume square grid for now
gridSizeDensity = 10
xSweep = linspace(-gridSize, gridSize, gridSizeDensity);
ySweep = linspace(-gridSize, gridSize, gridSizeDensity);

[x,y] = meshgrid(xSweep, ySweep);
[vX,vY] = uniformFlow(gridSize, gridSize, alpha, Vinf);

quiver(x,y,vX,vY,'r');         % Velocity vector arrows
xlim([min(xSweep) max(xSweep)]);         % Set X-axis limits
ylim([min(ySweep) max(ySweep)]);         % Set Y-axis limits
xlabel('X Axis');              % Set X-axis label
ylabel('Y Axis');              % Set Y-axis label
title('Uniform Flow');         % Set title


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%