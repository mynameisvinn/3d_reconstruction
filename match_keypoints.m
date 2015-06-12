original  = imread('im8272.jpg');
imshow(original);
title('Base image');
% distorted = imresize(original,0.7);
% distorted = imrotate(distorted,31);
distorted  = imread('im8270.jpg');
figure; imshow(distorted);
title('Transformed image');

%%
% convert to 1 dimension
original = im2bw(original, .1);
distorted = im2bw(distorted, .1);

%% detect and extract features from both images
ptsOriginal  = detectSURFFeatures(original);
ptsDistorted = detectSURFFeatures(distorted);
[featuresOriginal,validPtsOriginal] = extractFeatures(original, ptsOriginal);
[featuresDistorted,validPtsDistorted] = extractFeatures(distorted,ptsDistorted);

%% match features
index_pairs = matchFeatures(featuresOriginal,featuresDistorted);
matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1));
matchedPtsDistorted = validPtsDistorted(index_pairs(:,2));
figure; showMatchedFeatures(original,distorted,matchedPtsOriginal,matchedPtsDistorted);
title('Matched SURF points,including outliers');

%% Exclude the outliers, and compute the transformation matrix.
[tform,inlierPtsDistorted,inlierPtsOriginal] = estimateGeometricTransform(matchedPtsDistorted,matchedPtsOriginal,'similarity');
figure; showMatchedFeatures(original,distorted,inlierPtsOriginal,inlierPtsDistorted);
title('Matched inlier points');

%% recover original image from distorted image

outputView = imref2d(size(original));
Ir = imwarp(distorted,tform,'OutputView',outputView); % tform is the transformation matrix used to transform distorted image to new
figure; imshow(Ir);
title('Recovered image');

%% 
imshowpair(Ir, original, 'montage');