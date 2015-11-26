function img_out = shadow_detection(img )
% Converts shadow pixels to black and non-shadow pixels to white
lab_img = RGB2Lab(img);
mean_l = mean2(lab_img(:,:,1));
mean_a = mean2(lab_img(:,:,2));
mean_b = mean2(lab_img(:,:,3));
std_l = std2(lab_img(:,:,1))/3;
[m,n] = size(lab_img(:,:,1));
if(mean_a + mean_b <= 256)
    for i= 1:m
        for j= 1:n
            if(lab_img(i,j,1) <= mean_l - std_l)
                img(i,j,1)=0;
                img(i,j,2)=0;
                img(i,j,3)=0;
            else
                img(i,j,1)=1;
                img(i,j,2)=1;
                img(i,j,3)=1;
            end
        end
    end 
end
img_out=img;
end

