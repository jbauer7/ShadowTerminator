function out_img = edgeSmoothing(i,j,img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n,p] = size(img);
% ch1=bw_img(:,:,1);
% img =RGB2Lab(img);
z=6; %j offset
x=5;

a=1; %i offset
b=2;

if(j>6 && i>5 && i<m-1 && j<n-6)

    block_1 = [img(i+a,j-z,1),img(i+a,j-x,1),img(i+a,j+x,1),img(i+a,j+z,1);
        img(i,j-z,1),img(i,j-x,1),img(i,j+x,1),img(i,j+z,1);
        img(i-a,j-z,1),img(i-a,j-x,1),img(i-a,j+x,1),img(i-a,j+z,1);
        img(i-b,j-z,1),img(i-b,j-x,1),img(i-b,j+x,1),img(i-b,j+z,1)];
    
    block_2 = [img(i+a,j-z,2),img(i+a,j-x,2),img(i+a,j+x,2),img(i+a,j+z,2);
        img(i,j-z,2),img(i,j-x,2),img(i,j+x,2),img(i,j+z,2);
        img(i-a,j-z,2),img(i-a,j-x,2),img(i-a,j+x,2),img(i-a,j+z,2);
        img(i-b,j-z,2),img(i-b,j-x,2),img(i-b,j+x,2),img(i-b,j+z,2)];
    
    block_3 = [img(i+a,j-z,3),img(i+a,j-x,3),img(i+a,j+x,3),img(i+a,j+z,3);
        img(i,j-z,3),img(i,j-x,3),img(i,j+x,3),img(i,j+z,3);
        img(i-a,j-z,3),img(i-a,j-x,3),img(i-a,j+x,3),img(i-a,j+z,3);
        img(i-b,j-z,3),img(i-b,j-x,3),img(i-b,j+x,3),img(i-b,j+z,3)];
    
    avg_1 = mean2(block_1);
    avg_2 = mean2(block_2);
    avg_3 = mean2(block_3);
    
    std_1 = std2(block_1);
    std_2 = std2(block_2);
    std_3 = std2(block_3);
    
for k =0:3    
    img(i,j+k,1)= avg_1 + std_1/2;%(img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/3;
    img(i,j+k,2)= avg_2 + std_2/2;%(img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/3;
    img(i,j+k,3)= avg_3 + std_3/2;%(img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/3;
    
    img(i,j-k,1)= avg_1 + std_1/2;%(img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/3;
    img(i,j-k,2)= avg_2 + std_2/2;%(img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/3;
    img(i,j-k,3)= avg_3 + std_3/2;%(img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/3;
    
end

end
out_img = img;
end

