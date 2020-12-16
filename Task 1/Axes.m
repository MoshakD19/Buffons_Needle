% Number of squares
N = 150;

% Length of square
L = 0.1;

% Drawing lines
y = 0:0.2:1;
 
for x = 0:0.2:1
     hold on
     plot(x*ones(size(y)),y, 'Color', 'black') 
end

count = 0;

for num = 1:N
    % Pick two random coordinates for botton left corner of square
    randomX = rand(1);
    randomY = rand(1);
    
    check = 0;
    % Checks if square crosses a line
    for x = 0:0.2:1
        if (randomX < x) && ((randomX + L) > x)
            count = count + 1;
            rectangle('position', [randomX, randomY, L, L], 'Edgecolor', 'g');
            check = 1;
        end
    end
    
    if check == 0
        rectangle('position', [randomX, randomY, L, L]);
    end
end

% Calculate PI
pie = N / count;

% Display PI as Title
% //Code Here//

axis square