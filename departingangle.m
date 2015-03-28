function [ phi ] = departingangle( zi, zj, dij, B )
% Compute the ray departing angle for existence of a refracted path between
% two nodes i and j
% zi = depth of node i
% zj = depth of node j
% dij = horizontal distance between nodes i and j
% B = node i to line-of-centers distance
phi=atan((dij^2+(zi-zj)^2+2*(zi-zj)*B)/(2*dij*B));