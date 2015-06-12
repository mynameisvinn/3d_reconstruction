%% ALIGN MULTIPLE IMAGES

% list_of_data_ids = [];

for idx = 3:length(list_of_data_ids)
    
    % load previously registered item
    fixed_image_idx = list_of_data_ids(idx - 1);
    fixed_image_path = strcat('registered/__', num2str(fixed_image_idx), '_cropped_.jpg_processed.tif');
    fixed_image = uint8(imread(fixed_image_path));
    
    % load new image into memory
    image_to_be_aligned_idx = list_of_data_ids(idx);
    image_to_be_aligned_path = strcat('_', num2str(image_to_be_aligned_idx), '_cropped_.jpg_processed.tif');
    image_to_be_aligned = uint8(imread(image_to_be_aligned_path));
    
    % generate translated image
    [optimizer, metric] = imregconfig('Multimodal');
    registered_image = imregister(image_to_be_aligned, fixed_image, 'translation', optimizer, metric); % registered is the translated im1
    
    % save registered image in new folder
    filepath = strcat('registered/_', image_to_be_aligned_path);
    imwrite(logical(registered_image), filepath)
    
end
