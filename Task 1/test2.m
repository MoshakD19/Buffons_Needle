ax = axes;

% Number of squares
N = 150;

% Length of needle
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


    % Get start of needle perpendicular to needleX
    needleX3 = needleX + (L * cosd(needleAng + 90));

    % Get start of needle perpendicular to needleY
    needleY3 = needleY + (L * sind(needleAng + 90));

    % Get start of needle perpendicular to needleX2
    needleX4 = needleX2 + (L * cosd(needleAng + 90));

    % Get start of needle perpendicular to needleY2
    needleY4 = needleY2 + (L * sind(needleAng + 90));

    % Reset condtions
    check1 = 0;
    check2 = 0;
    check3 = 0;
    check4 = 0;
    
    for x = 0:(2 * L):1  
        
        
        % Check if first needle crosses a line
        if ((needleX < x) && (needleX2 > x)) || ((needleX > x) && (needleX2 < x))
            check1 = 1;
            if num < 1000
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            end
            count = count + 1;
        end
        
        
        % Check if second needle crosses a line
        if ((needleX < x) && (needleX3 > x)) || ((needleX > x) && (needleX3 < x))
            check = 1;
            if num < 1000
                 plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
            end
            count = count + 1;
        end
        
        
        % Check if third needle crosses a line
        if ((needleX2 < x) && (needleX3 > x)) || ((needleX2 > x) && (needleX3 < x))
            check = 1;
            if num < 1000
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
            end
            count = count + 1;
        end
        
        
        % Check if fourth needle crosses a line
        if ((needleX2 < x) && (needleX4 > x)) || ((needleX2 > x) && (needleX4 < x))
            check = 1;
            if num < 1000
                plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g'); 
            end
            count = count + 1;
        end 
    end
    
    
    hold on
    if check == 0 && num < 1000
        plot(ax, [needleX; needleX2], [needleY; needleY2], 'k');
        plot(ax, [needleX; needleX3], [needleY; needleY3], 'k');
        plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'k');
        plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'k'); 
    end
    
end

pie = N / count;

ax.Title.String = string(pie);
axis square