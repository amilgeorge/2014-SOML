
positiveSetDir  = fullfile('test1');
positiveImgSets = imageSet(positiveSetDir, 'recursive');

setDir  = fullfile('oxbuild');
imgSets = imageSet(setDir, 'recursive');

VocabSize=10000;

trainingSets = partition(positiveImgSets, 7);
%bag = bagOfFeatures(trainingSets,'VocabularySize',VocabSize,'Verbose',true);
loadbag = load('bag');
bag= loadbag.bag;
NumOfPositiveSamples=7;

w=rand(1,VocabSize);
for positiveImgSetIterator=1:length(positiveImgSets)
    negativeImgSets=getNegativeImageSet(imgSets(1,positiveImgSetIterator).Description);
    for i=1:NumOfPositiveSamples-1
        for j=i+1:NumOfPositiveSamples
        
        img = read(imgSets(positiveImgSetIterator), i);
        imgp = read(imgSets(positiveImgSetIterator), j);
        
        t = encode(bag, img);
        tp = encode(bag, imgp);
        
        for k=1:10
            for l=1:50
            imgn=read(imgSets(k), l);
            tn = encode(bag, imgn);
            [w,delta,loss] = soml(t,tp,tn,w);
            dispString = sprintf('Delta = %d  Loss = %d',delta,loss);
            disp(dispString);
            
            end
        end
          
            
                      
        end
    end
    
end

%img = read(imgSets(4), 1);
%imgp = read(imgSets(4), 2);
%imgn = read(imgSets(2), 1);

%t = encode(bag, img);
%tp = encode(bag, imgp);
%tn = encode(bag, imgn);


%figure;
%subplot(3,1,1);
%bar(t);
%subplot(3,1,2);
%bar(tp);
%subplot(3,1,3);
%bar(tn);



disp(imgSets);