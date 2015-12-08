function out_img = edgeSmoothing(i,j,img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% [m,n,p] = size(bw_img);
% ch1=bw_img(:,:,1);
% img =RGB2Lab(img);
if(j>4)
    img(i,j,1)= (img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/3;
    img(i,j,2)= (img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/3;
    img(i,j,3)= (img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/3;
%     img(i,j-1,1)= (img(i,j,1)+img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/4;
%     img(i,j-1,2)= (img(i,j,2)+img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/4;
%     img(i,j-1,3)= (img(i,j,3)+img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/4;
%     img(i,j-2,1)= (img(i,j,1)+img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/4;
%     img(i,j-2,2)= (img(i,j,2)+img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/4;
%     img(i,j-2,3)= (img(i,j,3)+img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/4;
%     img(i,j-3,1)= (img(i,j,1)+img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/4;
%     img(i,j-3,2)= (img(i,j,2)+img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/4;
%     img(i,j-3,3)= (img(i,j,3)+img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/4;
%             img(i,j-1,1)= (img(i,j,1)+img(i,j-1,1))/2;
%             img(i,j-1,2)= (img(i,j,2)+img(i,j-1,2))/2;
%             img(i,j-1,3)= (img(i,j,3)+img(i,j-1,3))/2;
end

% for j = 1 : n
%     for i = 2 : m
%         current=ch1(i,j);
%         previous=ch1(i-1,j);
%         if (current+previous==1)
%             img(i,j,1)= (img(i,j,1)+img(i-1,j,1))/2;
%             img(i,j,2)= (img(i,j,2)+img(i-1,j,2))/2;
%             img(i,j,3)= (img(i,j,3)+img(i-1,j,3))/2;
%             
%             img(i-1,j,1)= (img(i,j,1)+img(i-1,j,1))/2;
%             img(i-1,j,2)= (img(i,j,2)+img(i-1,j,2))/2;
%             img(i-1,j,3)= (img(i,j,3)+img(i-1,j,3))/2;
%         end
%     end
% end
out_img = img;
end

