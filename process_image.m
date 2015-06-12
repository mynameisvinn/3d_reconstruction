% created 6/12/15
% input: image
% output: resized image with fixed width and height

function new_image = process_image(image_path, scale_factor, threshold, scale_height, scale_width, pad_height, pad_width)

    image_original = imread(image_path); 
    
    % downsample image to 10%
    image_downsampled = imresize(image_original, scale_factor);
   
    % convert image to binary image to improve alignment
    image_downsampled_binary = im2bw(image_downsampled , threshold);
    
    % fill holes to improve alignment
    image_downsample_binary_filled = imfill(image_downsampled_binary, 'holes');
    
    % resize to create fixed width/height
    image_downsample_binary_filled_resized = imresize(image_downsample_binary_filled, [scale_height scale_width]);
    
    % increase dimensions but dont rescale image through padarray
    image_downsample_binary_filled_resized_padded = padarray(image_downsample_binary_filled_resized, [pad_height, pad_width]);
    
    % return file
    new_image = image_downsample_binary_filled_resized_padded;
    