img = imread('Shadows-dog.jpg');
img = im2double(img);

img = shadow_detection(img);

%img = imgaussfilt(img);
%Gaussian Filter to smooth transitions
% fil = fspecial('gaussian', 9, .5);
% img = conv2(img,fil);
%IMG = imgaussfilt(img, 1100);
img = im2uint8(img);
imshow(img);
%imwrite(img, 'shadow_game_out.jpg');