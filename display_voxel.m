% script for displaying voxels
% load the following two webpages
% http://www.thphys.nuim.ie/CompPhysics/matlab/help/techdoc/umg/chvolvi3.html
% http://web.mit.edu/8.13/matlab/MatlabTraining_IAP_2012/AGV/DemoFiles/ScriptFiles/html/Part7_SlicesIsosurfaces.html

% load mri
% D = squeeze(D);

%%
im1 = imread('8272_gray_noborder.tif');
im2 = imread('8270_gray_noborder.tif');
im3 = imread('8248_gray_noborder.tif');
im4 = imread('8152_gray_noborder.tif');

%% 

% im1_gray = rgb2gray(im1);
% im2_gray = rgb2gray(im2);
% im3_gray = rgb2gray(im3);
% im4_gray = rgb2gray(im4);

im1_gray = im1;
im2_gray = im2;
im3_gray = im3;
im4_gray = im4;


%%
D = cat(3, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im1_gray, im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im2_gray,im2_gray, im2_gray,im2_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im3_gray, im3_gray,im3_gray,im3_gray,im3_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray, im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray, im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray, im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray,im4_gray);

%%
% D = uint8(D);
% image_num = 8;
% image(D(:,:,image_num))
% axis image
% % colormap(map)
% x = xlim;
% y = ylim;
% contourslice(D,[],[],image_num)
% axis ij
% xlim(x)
% ylim(y)
% daspect([1,1,1])
% colormap('default')
phandles = contourslice(D,0,0,[1,100,200,300, 400, 500, 600],2);
view(3); axis tight
set(phandles,'LineWidth',2)

%% display isosurface

Ds = smooth3(D);
hiso = patch(isosurface(Ds,5),...
    'FaceColor',[1,.75,.65],...
    'EdgeColor','none');

hcap = patch(isocaps(D,5),...
    'FaceColor','interp',...
    'EdgeColor','none');
colormap(map)

%% show all of x/y axis but only when z = 1 or 200
contourslice(D,[],[],[1,200], 2)
axis ij
xlim(x)
ylim(y)
daspect([1,1,1])
colormap('default')

%% imshowpair
im5 = imread('8272_gray_noborder.tif');
im6 = imread('8270_gray_noborder.tif');
imshowpair(im5, im6, 'falsecolor')