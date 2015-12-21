img = imread('shadow-peace.jpg');
img = im2double(img);

img = shadow_detection(img);
%img = imgaussfilt(img);

%Gaussian Filter to smooth transitions
%fil = fspecial('gaussian', 9, .5);
%img = conv2(img,fil);
IMG = imgaussfilt(img,1);
figure,imshow(IMG);title('guass');
img = im2uint8(img);
figure, imshow(img); title('output image');
%imwrite(img, 'shadow_game_out.jpg');