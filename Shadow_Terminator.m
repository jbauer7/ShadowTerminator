img = imread('game_shadow.jpg');
img = im2double(img);

    img = shadow_detection(img);

img = imgaussfilt(img);
%Gaussian Filter to smooth transitions
img = im2uint8(img);
imwrite(img, 'shadow_game_out.jpg');