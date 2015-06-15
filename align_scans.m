function registered_image = align_scans(image_path_1, image_path_2)

    % align image 2 to image 1

    fixed_image = uint8(imread(image_path_1));
    image_to_be_aligned = uint8(imread(image_path_2));

    [optimizer, metric] = imregconfig('Multimodal');
    registered_image = imregister(image_to_be_aligned, fixed_image, 'translation', optimizer, metric); % registered is the translated im1

    figure, imshowpair(fixed_image, registered_image, 'falsecolor') 

    filepath = strcat('aligned', image_path_2);
    imwrite(registered_image, filepath)

end

