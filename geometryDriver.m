%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                      Geometry Driving Code
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% start with trivial circle case, eventually integrate selig airfoil loader
caseName = 'debug';
angleOfAttack = 0;
if strcmpi(caseName, 'debug')
    numBounds = 20;
    angOff = 22.5;
    radius = 1;
    %angles of circle
    theta = linspace(0,360,numB)';                                          % Create angles for computing boundary point locations [deg]
    theta = theta + tO;                                                     % Add angle offset [deg]
    theta = theta*(pi/180);                                                 % Convert from degrees to radians [rad]
    % Boundary points
    XB = cos(theta) * radius;                                              % Compute boundary point X-value (radius of 1)
    YB = sin(theta) * radius;                                              % Compute boundary point Y-value (radius of 1)
    
    numPan = length(XB)-1;                                                 % Number of panels
    edge = zeros(numPan,1);                                                % Initialize edge value array
    
    for i = 1:1:numPan                                                     % Loop over all panels
        edge(i) = (XB(i+1)-XB(i))*(YB(i+1)+YB(i));                         % Compute edge value
    end
    % if sum is negative, we know it's going CCW
    sumEdge = sum(edge);                                                   % Sum of all edge values
    
    % If panels are CCW, flip them (don't if CW)
    if (sumEdge < 0)                                                       % If panels are CCW
        XB = flipud(XB);                                                   % Flip the X-data array
        YB = flipud(YB);                                                   % Flip the Y-data array
    end
    
else
    % airfoil cases
end

% Now calcualte geometry 
% Initialize points 
XC = zeros(numPan, 1); % Control Points
YC = zeros(numPan, 1); % Control Points
S = zeros(numPan, 1);  % Length panels
phiD = zeros(numPan, 1); % Panel Orientation angle
deltaD = zeros(numPan, 1); % Normal Panel Angle
betaD = zeros(numPan, 1); % Angle between panel normal and AoA
for i = 1:numPan
    XC(i) = (XB(i) + XB(i+1)) * 0.5;
    YC(i) = (YB(i) + YB(i+1)) * 0.5;
    dx = (XB(i+1) - XB(i));
    dy = (YB(i+1) - YB(i));
    S(i) = sqrt(dx^2 + dy^2);
    phiD(i) = atan2d(dy, dx); 
    if (phiD(i) < 0)
        phiD(i) = phiD(i) + 360; % makes phiD positive
    end
    deltaD(i)             = phiD(i) + 90;                                            
    betaD(i)              = deltaD(i) - angleOfAttack;
    if (betaD(i) > 360)
        betaD(i) = betaD(i) - 360;
    end
    
end

%plotPanels(XB, YB)
%plotPanels(XB, YB, XC, YC, S, deltaD)
plotPanels(XB, YB, XC, YC, S, deltaD, 'firstTwo')
%plotPanels(XB, YB, XC, YC, S, deltaD, 'b', 'firstTwo')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%