N = 100;

L = 0.20;

xb = L + rand(1,N)*(1-2*L);
yb = L + rand(1,N)*(1-2*L);
angs = rand(1,N)*360;
xe = xb + L*cosd(angs);
ye = yb + L*sind(angs);

ax = axes;
plot(ax,[xb;xe],[yb;ye])
axis square