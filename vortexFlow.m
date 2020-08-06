%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                     VORTEX FLOW CALCULATOR
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [vX, vY, vR, vTheta, vMag] = vortexFlow(x,y, gridSize, gamm, xLoc, yLoc)

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
            vX(i,j) = gamm*dy / (2*pi*r^2);
            vY(i,j) = -gamm*dx / (2*pi*r^2);
            vR(i,j) = 0;
            vTheta(i,j) = -gamm/(2*pi*r);
            vMag(i,j) = ((vX(i,j)^2) + (vY(i,j)^2))^0.5;
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%