
% Compute the ray departing angle for existence of a refracted path between
% two nodes i and j
% zi = depth of node i
% zj = depth of node j
% dij = horizontal distance between nodes i and j
% B = node i to line-of-centers distance
function [ phi ] = departingangle( zi, zj, dij, B )

% sound speed at sea surface (m/s)
c0 = 1500;
% water depth (m)
D = 200;
% node depth array
z = [ 150 135 147 125 150 143 ];
% horizontal distances relative to node 1
d = [ 0 400, 1000, 1600, 1900, 2600 ];
% sound speed profile gradient (1/s)
g = -1/4;
% compute sound speed at the depth of each node
c = c0 + g*z;
% beamwidth (radians)
beta = 10/180*pi;
% directionality
alpha = -beta/2; % Examples 1 & 2
% compute max departing angle
phimax = acos( c / c0 );
fprintf('Maximum departing angles (in degrees) are:\n');
disp(phimax/pi*180);
% determine indices of nodes with rays hitting the surface
indices=find(phimax<(alpha+beta));
if ~sum(indices)
fprintf('No ray is hitting sea surface.\n');
else
fprintf('Nodes with ray(s) hitting sea surface:\n');
disp(indices);
end

% determine departure angles for existence of path between any node pair
phi=zeros(length(z),length(z));
for i=1:length(z)
for j=1:length(z)
if i<j
phi(i,j) = departingangle( z(i), z(j), d(j)-d(i), -c(i)/g );
end;
end;
end;
fprintf('Departing angles (in degrees) are:\n');
disp(phi./pi*180);
% post connected pairs
fprintf('Connected node pairs are:\n');
for i=1:length(z)
for j=1:length(z)
if i<j && alpha<=phi(i,j) && phi(i,j)<=alpha+beta
fprintf('(%d,%d) ', i, j);
end;
end;
end;
fprintf('\n ', i, j);