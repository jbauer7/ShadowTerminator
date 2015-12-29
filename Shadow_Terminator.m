%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shadow Terminator:
%
%Shadow terminator detects shadows in images then attemps to remove the 
%shadow from the image.
%
%For more information go to this URL: 
%https://sites.google.com/a/wisc.edu/shadow-terminator/
%
%Authors: Jospeh Bauer, Elliot Busta, Eric Johnson
%
%Other Contributions:
%RGB2Lab.m and Lab2RGB.m are functions provide by Professor for Homework #2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%uncomment next line to auto close figures!
%close all;

%Example images are located in the Input_Images/ directory
%labled input1, input2,..., input6
img = imread('Input_Images/input5.jpg');

img = im2double(img);

%Calls shadow dection and shadow removal
img = shadowDetectionRemoval(img);

%Gaussian Filter to smooth transitions
IMG = imgaussfilt(img,1);

%displays output wiht guassian blur 
figure,imshow(IMG);title('guass');

img = im2uint8(img);

%Displays Output Image
figure, imshow(img); title('output image');

%Saves Output Image to Output_Images/ directory
imwrite(img, 'Output_Images/output5.jpg');