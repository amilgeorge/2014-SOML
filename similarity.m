function [ o ] = similarity( x,y,M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x1=x';
y1=y';
y_1 = M * y';

o1=dot(x,y_1');

o=x1'*M*y1;

disp(o1-o);
end

