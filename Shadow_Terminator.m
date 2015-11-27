img = imread('shadow_edit.jpg');
img = im2double(img);
img = shadow_detection(img);

% Gaussian Filter to smooth transitions
img = im2uint8(img);
imwrite(img, 'shadow_out.jpg');