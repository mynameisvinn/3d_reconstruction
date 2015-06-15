% using matlab's registration
% http://www.mathworks.com/company/newsletters/articles/automating-image-registration-with-matlab.html

fixed_image = uint8(imread('8270_gray_noborder.tif'));
image_to_be_aligned = uint8(imread('8272_gray_noborder.tif'));

%%
[optimizer, metric] = imregconfig('Multimodal');
registered_image = imregister(image_to_be_aligned, fixed_image, 'translation', optimizer, metric); % registered is the translated im1
%% inspect overlap
figure, imshowpair(fixed_image, registered_image, 'falsecolor') 

%% 

filepath = strcat('8272_gray_noborder_aligned.tif');
imwrite(registered_image, filepath)

% always compare im2 to registered
% comparing im1 to registered is comparing the translation

%%
figure, imshowpair(image_to_be_aligned, registered_image, 'montage') % registered is the translated im1

