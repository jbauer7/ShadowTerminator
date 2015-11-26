img = imread('shadow_edit.jpg');
img = im2double(img);
img = shadow_detection(img);
imwrite(img, 'shadow_out.jpg');