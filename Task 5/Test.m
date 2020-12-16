ax = axes;

% Number of needles
N = 100;

% Length of needles
L = 0.1;

% Drawing lines
y = L:(2 * L):1 - L;

% Plotting floorboards
for x = L:(2 * L):1 - L
     hold on
     plot(ax, x*ones(size(y)),y, 'k');
end

% Used to calculate PI
count = 0;

% Counters
Nc = 0;
Ncc = 0;

for num = 1:N
    % Get starting X value for 1st Needle
    needleX = rand(1) * (1 - 2*L);

    if needleX > (1 - L)
        needleX = needleX - L;
    end

    if needleX < L
        needleX = needleX + L;
    end

    % Get starting Y value for 1st Needle
    needleY = rand(1) * (1 - 2*L);

    if needleY > (1 - L)
        needleY = needleY - L;
    end

    if needleY < L
        needleY = needleY + L;
    end

    % Get Angle for 1st needle
    needleAng = rand(1) * 360;

    % Get ending X value for 1st Needle
    needleX2 = needleX  + (L * cosd(needleAng));

    % Get ending Y value for 1st Needle
    needleY2 = needleY + (L * sind(needleAng));
    
    
    % Get start of 2nd needle
    needleX3 = needleX + (L * cosd(needleAng + 108));
    needleY3 = needleY + (L * sind(needleAng + 108));
    
    % Get start of 3rd needle
    needleX4 = needleX2 + (L * cosd(needleAng + 72));
    needleY4 = needleY2 + (L * sind(needleAng + 72));
    
    % Get start of 4th needle
    needleX5 = needleX3 + (L * cosd(needleAng + 36));
    needleY5 = needleY3 + (L * sind(needleAng + 36));
    
    % Reset condtion
    check1 = 0;
    check2 = 0;
    check3 = 0;
    check4 = 0;
    check5 = 0;
    
    for x = L:(2 * L):1 - L
        if ((needleX < x) && (needleX2 > x)) || ((needleX > x) && (needleX2 < x))
            check1 = 1;
            if num < 100
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
                plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
            end
        end
        
        if ((needleX < x) && (needleX3 > x)) || ((needleX > x) && (needleX3 < x))
            check2 = 1;
            if num < 100
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
                plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
            end
        end
        
        if ((needleX2 < x) && (needleX4 > x)) || ((needleX2 > x) && (needleX4 < x))
            check3 = 1;
            if num < 100
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
                plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
            end
        end
        
        if ((needleX3 < x) && (needleX5 > x)) || ((needleX3 > x) && (needleX5 < x))
            check4 = 1;
            if num < 100
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
                plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
            end
        end
        
        if ((needleX5 < x) && (needleX4 > x)) || ((needleX5 > x) && (needleX4 < x))
            check5 = 1;
            if num < 100
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
                plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
            end
        end
    end

    % Check if line intersects two consecutive sides
    if check1 == 1 && check2 == 1
        Ncc = Ncc + 1;
    end

    if check1 == 1 && check3 == 1
        Ncc = Ncc + 1;
    end

    if check3 == 1 && check5 == 1
        Ncc = Ncc + 1;
    end

    if check2 == 1 && check4 == 1
        Ncc = Ncc + 1;
    end
    
    if check5 == 1 && check4 == 1
        Ncc = Ncc + 1;
    end
    
    % Plot needles
    if check1 == 0 && check2 == 0 && check3 == 0 && check4 == 0 && check5 == 0
        if num < 100
            hold on
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'k');
            plot(ax, [needleX; needleX3], [needleY; needleY3], 'k');
            plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'k');
            plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'k');
            plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'k');
        end
    else
        Nc = Nc + 1;
        if num < 100
            hold on
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
            plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
            plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
            plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');
        end
    end
        
end

gold = 2 - (Ncc / Nc);

ax.Title.String = string(gold);
axis square