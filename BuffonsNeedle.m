ax = axes;

% Number of needles
N = 100;

% Length of needles
L = 0.1;

% Drawing lines
y = 0:0.2:1;

% Plotting floorboards
for x = 0:0.2:1
     hold on
     plot(ax, x*ones(size(y)),y, 'k');
end

% Used to calculate PI
count = 0;



for num = 1:N
    randL = (maxL - minL).*rand(1) + minL;
    
    % Get starting X value for Needle
    needleX = rand(1) * (1 - 2*L);

    if needleX > (1 - L)
        needleX = needleX - L;
    end

    if needleX < L
        needleX = needleX + L;
    end

    % Get starting Y value for Needle
    needleY = rand(1) * (1 - 2*L);

    if needleY > (1 - L)
        needleY = needleY - L;
    end

    if needleY < L
        needleY = needleY + L;
    end

    % Get Angle for needle
    needleAng = rand(1) * 360;

    plot(ax, needleX, needleY)

    % Get ending X value for Needle
    needleX2 = needleX  + (L * cosd(needleAng));

    % Get ending Y value for Needle
    needleY2 = needleY + (L * sind(needleAng));
    
    % Reset condtion
    check = 0;
    
    for x = 0:(2 * L):1
        if (needleX < x) && (needleX2 > x)
            check = 1;
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            count = count + 1;
        end
        
        if (needleX > x) && (needleX2 < x)
            check = 1;
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            count = count + 1;
        end
    end

    % Plot needles
    if check == 0
        hold on
        plot(ax, [needleX; needleX2], [needleY; needleY2], 'k');
    end
end

pie = N / count;

ax.Title.String = string(pie);
axis square