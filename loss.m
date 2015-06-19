function [ l ] = loss( t,tp,tn, M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Sp = similarity(t,tp,M);
Sn = similarity(t,tn,M);

l= 1 - Sp +Sn;

l=max (0,l);

end

