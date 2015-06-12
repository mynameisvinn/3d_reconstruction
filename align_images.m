% using matlab's registration
% http://www.mathworks.com/company/newsletters/articles/automating-image-registration-with-matlab.html

fixed_image = uint8(imread('_8304_cropped_.jpg_processed.tif'));
image_to_be_aligned = uint8(imread('_8302_cropped_.jpg_processed.tif'));

%%
[optimizer, metric] = imregconfig('Multimodal');
registered_image = imregister(image_to_be_aligned, fixed_image, 'translation', optimizer, metric); % registered is the translated im1
%%
% figure, imshowpair(fixed_image, registered_image, 'falsecolor') 

filepath = strcat('registered/_', '_8302_cropped_.jpg_processed.tif');
imwrite(logical(registered_image), filepath)

% always compare im2 to registered
% comparing im1 to registered is comparing the translation

%%
figure, imshowpair(image_to_be_aligned, registered_image, 'montage') % registered is the translated im1