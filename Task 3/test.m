ax = axes;

% Number of needles
N = 1000;

% Length of needles
L = 0.1;

% Drawing vertical lines
y = L:(2 * L):1 - L;

% Drawing horizontal lines
x = L:(2 * L):1 - L;

% Plotting vertical lines
for xVal = L:(2 * L):1 - L
     hold on
     plot(ax, xVal*ones(size(y)),y, 'k');
end

% Plotting vertical lines
for yVal = L:(2 * L):1 - L
     hold on
     plot(ax, x, yVal*ones(size(x)), 'k');
end

% Used to calculate PI
count = 0;


for num = 1:N
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

    % Get ending X value for Needle
    needleX2 = needleX  + (L * cosd(needleAng));

    % Get ending Y value for Needle
    needleY2 = needleY + (L * sind(needleAng));
    
    % Reset condtion
    check = 0;
    
    % Check if needle crosses vertical lines
    for x = L:(2 * L):1 - L
        if (needleX < x) && (needleX2 > x)
            check = 1;
            if num < 1000
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            end
        end
        
        if (needleX > x) && (needleX2 < x)
            check = 1;
            if num < 1000
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            end
        end
    end
    
    if check == 0
        % Check if needle crosses horizontal lines
        for y = L:(2 * L):1 - L
            if (needleY < y) && (needleY2 > y)
                check = 1;
                if num < 1000
                    plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                end
            end

            if (needleY > y) && (needleY2 < y)
                check = 1;
                if num < 1000
                    plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                end
            end
        end
    end
    
    if check == 1
        count = count + 1;
    end

    % Plot needles
    if check == 0 && num < 1000
        hold on
        plot(ax, [needleX; needleX2], [needleY; needleY2], 'k');
    end
end

top = ((2 * L) * ((2 * L) + (2 * L))) - (L * L);

bottom = (2 * L) * (2 * L) * (count / N);

pie = top / bottom;

ax.Title.String = string(pie);
axis square