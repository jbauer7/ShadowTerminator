function img_out = shadow_detection(img )
% Converts shadow pixels to black and non-shadow pixels to white
mean_nonShadow_l=0;
mean_nonShadow_a=0;
mean_nonShadow_b=0;
mean_Shadow_l=0;
mean_Shadow_a=0;
mean_Shadow_b=0;
num_Shadow=0;
num_nonShadow=0;

lab_img = RGB2Lab(img);
%reads energy of original image
E = imenergy(img);

% values are used to find shadowed regions
mean_l = mean2(lab_img(:,:,1));
mean_a = mean2(lab_img(:,:,2));
mean_b = mean2(lab_img(:,:,3));
std_l = std2(lab_img(:,:,1))/3;
[m,n] = size(lab_img(:,:,1));

if(mean_a + mean_b <= 256)
    for i= 1:m
        for j= 1:n
            %finding the average value of the shadowed areas of the image
            if(lab_img(i,j,1) <= mean_l - std_l)
                mean_Shadow_l = mean_Shadow_l + lab_img(i,j,1);
                mean_Shadow_a = mean_Shadow_a + lab_img(i,j,2);
                mean_Shadow_b = mean_Shadow_b + lab_img(i,j,3);
                num_Shadow = num_Shadow + 1;
            %find the average value of the non-shadowed areas of the image 
            else
                mean_nonShadow_l = mean_nonShadow_l + lab_img(i,j,1);
                mean_nonShadow_a = mean_nonShadow_a + lab_img(i,j,2);
                mean_nonShadow_b = mean_nonShadow_b + lab_img(i,j,3);
                num_nonShadow= num_nonShadow + 1;
            end
        end
    end 
end

% Calculates mean of shadow and no-shadow regions
mean_nonShadow_l = mean_nonShadow_l/num_nonShadow;
mean_Shadow_L = mean_Shadow_l/num_Shadow;
mean_nonShadow_a = mean_nonShadow_a/num_nonShadow;
mean_Shadow_a = mean_Shadow_a/num_Shadow;
mean_nonShadow_b = mean_nonShadow_b/num_nonShadow;
mean_Shadow_b = mean_Shadow_b/num_Shadow;

% find the correction factor of shadowed regions
diff_l = mean_Shadow_L - mean_nonShadow_l;
diff_a = mean_Shadow_a - mean_nonShadow_a;
diff_b = mean_Shadow_b - mean_nonShadow_b;

% Correct shadowed area of image

for i= 1:m
        for j= 1:n
            %if the the pixel meets the energy threshold, replace
            %eliminats the glow
            if(E(i,j) == 1)
                if(i > 5)
                    lab_img(i,j,1) = lab_img(i-5,j,1);
                    lab_img(i,j,2) = lab_img(i-5,j,2);
                    lab_img(i,j,3) = lab_img(i-5,j,3);
                end
            end
            if(lab_img(i,j,1) <= mean_l - std_l)
                lab_img(i,j,1) = lab_img(i,j,1) - diff_l;
                lab_img(i,j,2) = lab_img(i,j,2) - diff_a;
                lab_img(i,j,3) = lab_img(i,j,3) - diff_b;
                
            end
        end
end

img = Lab2RGB(lab_img);
%imenergy(img);
img_out=img;
end

