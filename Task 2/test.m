ax = axes;
ax.Title.String = 'PI';

% Number of squares
N = 1000000;

% Length of needle
L = 0.1;

% Drawing lines
y = 0:0.2:1;

% Plotting floorboards
for x = L:(2 * L):(1 - L) 
     hold on
     plot(ax, x*ones(size(y)),y, 'k');
end

% Counters
Nc = 0;
Ncc = 0;
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
    
    for x = L:(2 * L):(1 - L)  
        
        
        % Check if first needle crosses a line
        if ((needleX < x) && (needleX2 > x)) || ((needleX > x) && (needleX2 < x))
            check1 = 1;
            if num < 500
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g');
            end
        end
        
        
        % Check if second needle crosses a line
        if ((needleX < x) && (needleX3 > x)) || ((needleX > x) && (needleX3 < x))
            check2 = 1;
            if num < 500
                 plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                 plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                 plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                 plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g'); 
            end
        end
        
        
        % Check if third needle crosses a line
        if ((needleX2 < x) && (needleX4 > x)) || ((needleX2 > x) && (needleX4 < x))
            check3 = 1;
            if num < 500
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g'); 
            end
        end 
        
        
        % Check if fourth needle crosses a line
        if ((needleX3 < x) && (needleX4 > x)) || ((needleX3 > x) && (needleX4 < x))
            check4 = 1;
            if num < 500
                plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
                plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
                plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
                plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g'); 
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
    
    if check3 == 1 && check4 == 1
        Ncc = Ncc + 1;
    end
    
    if check2 == 1 && check4 == 1
        Ncc = Ncc + 1;
    end
    
    if check1 == 0 && check2 == 0 && check3 == 0 && check4 == 0
        if num < 500
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'k');
            plot(ax, [needleX; needleX3], [needleY; needleY3], 'k');
            plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'k');
            plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'k');
        end
    else
        Nc = Nc + 1;
        if num < 500
            plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
            plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
            plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
            plot(ax, [needleX3; needleX4], [needleY3; needleY4], 'g');
        end
    end
    
end

root2 = 2 - (Ncc / Nc);

ax.Title.String = string(root2);

axis square