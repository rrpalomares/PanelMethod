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
% INPUT
gridSize = 100; % assume square grid for now
gridLims = 10; %(x and y coords)
Vinf = 5;
alpha = 0;
lambda = 5;
gamm = 1;
xLoc = 0;
yLoc = 0;
numStreams = 50;
xStart = -10.*ones(numStreams,1);                                                
yStart = linspace(-gridLims,gridLims,numStreams);                                            
%%%%%%%%%%%%



xSweep = linspace(-gridLims, gridLims, gridSize);
ySweep = linspace(-gridLims, gridLims, gridSize);

[x,y] = meshgrid(xSweep, ySweep);
%[vX,vY] = uniformFlow(gridSize, alpha, Vinf);

%[vXS, vYS ] = sourceSink(x,y, gridSize, lambda, xLoc, yLoc);
%vX = vX + vXS;
%vY = vY + vYS;
[vX, vY] = vortexFlow(x,y, gridSize, gamm, xLoc, yLoc);
hold on
quiver(x,y,vX,vY,'r');         % Velocity vector arrows

xlim([min(xSweep) max(xSweep)]);         % Set X-axis limits
ylim([min(ySweep) max(ySweep)]);         % Set Y-axis limits
xlabel('X Axis');              % Set X-axis label
ylabel('Y Axis');              % Set Y-axis label
title('Uniform Flow');         % Set title
streamline(x,y,vX,vY,xStart,yStart)                             

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%