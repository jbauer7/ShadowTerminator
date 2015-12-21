img = imread('shadow-three.jpg');
img = im2double(img);

img = shadow_detection(img);
%img = shadow_detection(img);
I=img;
% E = edge(img(:,:,1),'canny');
% figure;
% imshow(E);
% 
%Dilate the edges
% Ed = imdilate(E,strel('disk',30));
% Ed3 = repmat(Ed,[1 1 3]);
% %Filtered image
% Ifilt = imfilter(I,fspecial('gaussian'));
% %Use Ed as logical index into I to and replace with Ifilt
% I(Ed3) = Ifilt(Ed3);

figure;
imshow(I);

Iblur1 = imgaussfilt(img,2);
Iblur2 = imgaussfilt(img,4);
Iblur3 = imgaussfilt(img,8);

img = im2uint8(img);
figure
imshow(img)
title('Original image')

figure
imshow(Iblur1)
title('Smoothed image, \sigma = 2')

figure
imshow(Iblur2)
title('Smoothed image, \sigma = 4')

figure
imshow(Iblur3)
title('Smoothed image, \sigma = 8')
%figure, imshow(img); title('output image');
%imwrite(img, 'shadow_game_out.jpg')