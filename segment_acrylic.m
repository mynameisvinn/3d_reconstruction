function segmented_image = segment_acrylic(data_id)

    % STEP 1: read image into memory
    conn = database('limsdb','lims','mou53Brains!');
    curs = exec(conn,[]);

    sql = ['SELECT primary_file_system_location_lossy FROM data_file WHERE id = "' num2str(data_id) '"'];
    curs = exec(conn,sql);
    curs = fetch(curs);
    imagefilename = curs.Data;
    path = strcat('Z:\Converted Image Data\', imagefilename);

    im0 = imread(char(path));

    % STEP 2: process image
    
    % recast from uint16 to uint8
    im0 = uint8(im0);

    % resize for visual inspection 
    im1 = imresize(im0, .1);

    % convert to hsv colorspace
    im2 = rgb2hsv(im1);

    % isolate hue
    im3 = im2(:,:,1);

    % convert to a hue angle, which is required for color subsetting
    im4 = im3 .* 360;

    % cast im4 (double) to im5 (int8)
    im5 = uint8(im4);

    % create acrlyic hue mask (values greater than 250)
    im6 = (im5 > 250);

    % denoise background via erosion
    se = strel('rectangle',[5 5]);
    im7 = imerode(im6,se);
    
    % fill in holes
    im8 = imfill(im7, 'holes');
    
    % STEP 3: generate mask
    
    % label objects in image
    [labels, num] = bwlabel(im8);
    
    s = regionprops(im8, 'Area');
    [~,ind] = max([s.Area]);

    % select object using index that corresponding to largest area
    image_mask_1 = ismember(labels,ind);
    
    % recast from logical to 8int
    image_mask_2 = uint8(image_mask_1);
    
    % generate segmented image
    segmented_image = im1.*repmat(image_mask_2,[1,1,3]);

end

