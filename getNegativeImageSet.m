function [ negativeImgSet ] = getNegativeImageSet( imgSetName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
setDir  = fullfile('oxbuild');
imgSets = imageSet(setDir, 'recursive');
l=length(imgSets);
%negativeImgSet=zeros(size(imgSets));
negImgSetSize=0;
for i=1:l
    if(strcmp(imgSetName,imgSets(1,i).Description)==0)
        negImgSetSize=negImgSetSize+1;
        negativeImgSet(1,negImgSetSize) = imgSets(1,i);
    end
end


negativeImgSet = partition(negativeImgSet, 50);
    
end

