ax = axes;

% Number of needles
N = 100;

% Length of needles
L = 0.1;


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
needleAng = 0;

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

hold on
plot(ax, [needleX; needleX2], [needleY; needleY2], 'g');
plot(ax, [needleX; needleX3], [needleY; needleY3], 'g');
plot(ax, [needleX2; needleX4], [needleY2; needleY4], 'g');
plot(ax, [needleX3; needleX5], [needleY3; needleY5], 'g');
plot(ax, [needleX5; needleX4], [needleY5; needleY4], 'g');

axis square
