img = imread('shadow-three.jpg');
img = im2double(img);
img = shadow_detection(img);

%Gaussian Filter to smooth transitions
IMG = imgaussfilt(img,1);
figure,imshow(IMG);title('guass');
img = im2uint8(img);
figure, imshow(img); title('output image');
%imwrite(img, 'shadow_game_out.jpg');