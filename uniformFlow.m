%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                     UNIFORM FLOW CALCULATOR
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [vX, vY] = uniformFlow(gridsize, alpha, vInf)

    vX = zeros(gridsize, gridsize);
    vY = zeros(gridsize, gridsize);

    for i = 1:gridsize
        for j = 1:gridsize
            vX(i,j) = vInf * cosd(alpha);
            vY(i,j) = vInf * sind(alpha);
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%