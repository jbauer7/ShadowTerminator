function img_out = shadowDetectionRemoval(img )  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The general method for the shadow detction and removal is as follows:
%(1) Convert image to LAB color space
%(2) Detect shadow using mean and standard deviation thresholds
%(3) Find average luminosity of shadowed and non-shadowed region
%(4) Replace pixel luminosity (L channel) of shadowed region with the mean
%    from the non-shadow region using mean shift algorithm
%(5) Use mean shift on shadow region on the A and B channels to adjust
%    chromaticity 
%(6) Smooth edges to increase continuity of image
%(7) Convert back to RGB color space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Variables used for mean shift
mean_nonShadow_l=0;
mean_nonShadow_a=0;
mean_nonShadow_b=0;
mean_Shadow_l=0;
mean_Shadow_a=0;
mean_Shadow_b=0;
num_Shadow=0;
num_nonShadow=0;
%BW image white represents area of image that is detected as a shadow
bw_img = img; %correctly sizes bw img

% Step (1) convert to LAB space
lab_img = RGB2Lab(img);

% values are used to calculate offset to find shadowed regions
mean_l = mean2(lab_img(:,:,1));
mean_a = mean2(lab_img(:,:,2));
mean_b = mean2(lab_img(:,:,3));
std_l = std2(lab_img(:,:,1))/3;
[m,n] = size(lab_img(:,:,1));

% Step (2) detecting shadowed regions
if(mean_a + mean_b <= 256)
    for i= 1:m
        for j= 1:n
            %finding the average value of the shadowed areas of the image
            if(lab_img(i,j,1) <= mean_l - std_l)
                mean_Shadow_l = mean_Shadow_l + lab_img(i,j,1);
                mean_Shadow_a = mean_Shadow_a + lab_img(i,j,2);
                mean_Shadow_b = mean_Shadow_b + lab_img(i,j,3);
                num_Shadow = num_Shadow + 1;
                
                bw_img(i,j,:)=1; %creates bw image
                
            %find the average value of the non-shadowed areas of the image 
            else
                mean_nonShadow_l = mean_nonShadow_l + lab_img(i,j,1);
                mean_nonShadow_a = mean_nonShadow_a + lab_img(i,j,2);
                mean_nonShadow_b = mean_nonShadow_b + lab_img(i,j,3);
                num_nonShadow= num_nonShadow + 1;
                
                bw_img(i,j,:)=0; %creates bw image
            end
        end
    end 
end

% Step (3) Calculates mean of shadow and non-shadow regions
mean_nonShadow_l = mean_nonShadow_l/num_nonShadow;
mean_Shadow_L = mean_Shadow_l/num_Shadow;
mean_nonShadow_a = mean_nonShadow_a/num_nonShadow;
mean_Shadow_a = mean_Shadow_a/num_Shadow;
mean_nonShadow_b = mean_nonShadow_b/num_nonShadow;
mean_Shadow_b = mean_Shadow_b/num_Shadow;

% Step (3) find the correction factor of shadowed regions
diff_l = mean_Shadow_L - mean_nonShadow_l;
diff_a = mean_Shadow_a - mean_nonShadow_a;
diff_b = mean_Shadow_b - mean_nonShadow_b;

%Step(4) and Step(5) mean shift algorithm
for i= 1:m
        for j= 1:n
            %mean shift on LAB color space of shadowed region
            if(lab_img(i,j,1) <= mean_l - std_l)
                lab_img(i,j,1) = lab_img(i,j,1) - diff_l;
                lab_img(i,j,2) = lab_img(i,j,2) - diff_a;
                lab_img(i,j,3) = lab_img(i,j,3) - diff_b;         
            end
        end
end

% Step(6) Edge smoothing
% Creating different masks 
bw_img = rgb2gray(bw_img);
E_BW = imenergy(bw_img);

%display edge detection
figure,imshow(E_BW);title('Energy and Black/White');
for i= 1:m
        for j= 2:n
            %if the the pixel meets the energy threshold, replace
            %eliminats the glow
            if(E_BW(i,j) == 1)
                lab_img = edgeSmoothing(i,j,lab_img);
            end
        end
end

%Step(7) convert to RGB color space 
img_out = Lab2RGB(lab_img);
end

