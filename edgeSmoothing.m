function out_img = edgeSmoothing(i,j,img)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Edge Smoothing - takes away the shadow glow by averaging pixels 
%surrounding the selected pixel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% size variables 
[m,n,p] = size(img);

%n (columns) pixel offsets
z=6;
x=5;

%m (rows) offset
a=1; 
b=2;

% Each block is a 4x4 matrix created around the desired glow pixel  
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
    
    %The average and standard deviation of each 4x4 matrix   
    avg_1 = mean2(block_1);
    avg_2 = mean2(block_2);
    avg_3 = mean2(block_3);
    
    std_1 = std2(block_1);
    std_2 = std2(block_2);
    std_3 = std2(block_3);
    
    %smoothing glow pixel to the averge surrounding pixels plus 1/2 the 
    %standard deviation
    for k =0:2    
        img(i,j+k,1)= avg_1 + std_1/2;
        img(i,j+k,2)= avg_2 + std_2/2;
        img(i,j+k,3)= avg_3 + std_3/2;
    
        img(i,j-k,1)= avg_1 + std_1/2;
        img(i,j-k,2)= avg_2 + std_2/2;
        img(i,j-k,3)= avg_3 + std_3/2;
    end

end

out_img = img;
end

