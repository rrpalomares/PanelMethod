%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%                      Panel Plotting code
%%%
%%%                     WRITTEN BY: R R PALOMARES
%%%                            AUGUST 8, 2020
%%%                 Transcribed mostly from JTE videos
%%%
%%%             
%%%             INPUTS: XB, YB - Boundary point vectors
%%%             OPTIONAL:
%%%                      - Normal Inputfollowed by XC, YC, S, delta (control points)
%%%                         ex: (XB, YB, XC, YC, S, delta)
%%%                      - Add 'firstTwo' flag to end to see first two
%%%                        normal vectors colored differently to ensure
%%%                        CW panels
%%%                         ex: (XB, YB, XC, YC, S, delta, 'firstTwo')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function fig = plotPanels(XB, YB, varargin)
plotNorms = false;
plotTwo = false;
if (length(varargin)> 0) % only check when varargins are used
    if (length(varargin) >= 4 && length(varargin) < 6)
        plotNorms = true;
        XC = varargin{1};
        YC = varargin{2};
        S = varargin{3};
        deltaD = varargin{4};
        if length(varargin) == 5
            arg = varargin{5}
            if strcmpi(arg, 'firstTwo')
                plotTwo = true;
            else
                Error('Bad Arguement to plotPanels');
            end
        end
    elseif (length(varargin) > 5 || length(varargin) < 4)
        Error('INCORRECT # INPUTS TO plotPanels');
    end
end
% Plot Panels
% add toggle for fill or no fill? hmm.
fig = figure(1);                                                           
cla; hold on; grid off;                                                    
set(gcf,'Color','White');                                                   
set(gca,'FontSize',12);                                                     
fill(XB,YB,'k');                                                           

if(plotNorms)
    for i = 1:length(XC)                                                   % Loop over all panels
        % essentially, this just plots the normal vecs 
        % and the scalar length is just the panel length of S
        X(1) = XC(i);                                                      % Normal Vec starting X point
        X(2) = XC(i) + S(i)*cosd(deltaD(i));                               % Normal Vec ending X point                                                  % Panel starting X point
        Y(1) = YC(i);                                                      % Normal Vec starting Y point
        Y(2) = YC(i) + S(i)*sind(deltaD(i));                               % Normal Vec ending Y point
        if (plotTwo && i <= 2)
            if (i == 1)                                                    % For first panel
                p1 = plot(X,Y,'b-','LineWidth',2);                         % Plot first panel normal vector
            else                                                           % For second panel
                p2 = plot(X,Y,'g-','LineWidth',2);                         % Plot second panel normal vector
            end
        else
            plot(X,Y,'r-','LineWidth',2);                                       % Plot panel normal vector
        end
    end
end
if (plotTwo)
    legend([p1,p2],{'Panel 1','Panel 2'});                                      % Add legend
end
xlabel('X Units');                                                          % Set X-label
ylabel('Y Units');                                                          % Set Y-label
axis equal;                                                                 % Set axes equal
zoom reset;      

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%