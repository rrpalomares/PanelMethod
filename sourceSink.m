%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                     SOURCE / SINK FLOW CALCULATOR
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [vX, vY, vR, vTheta, vMag] = sourceSink(x,y, gridSize, lambda, xLoc, yLoc)

    vX = zeros(gridSize, gridSize);
    vY = zeros(gridSize, gridSize);
    vR = zeros(gridSize, gridSize);
    vTheta = zeros(gridSize, gridSize);
    vMag = zeros(gridSize, gridSize);
    for i = 1:gridSize
        for j = 1:gridSize
            dx = x(i,j) - xLoc;
            dy = y(i,j) - yLoc;
            r = (dx^2 + dy^2)^0.5;
            vX(i,j) = lambda*dx / (2*pi*r^2);
            vY(i,j) = lambda*dy / (2*pi*r^2);
            vR(i,j) = lambda/(2*pi*r);
            vTheta(i,j) = 0;
            vMag(i,j) = ((vX(i,j)^2) + (vY(i,j)^2))^0.5;
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%