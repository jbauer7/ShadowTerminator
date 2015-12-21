function out_img = edgeSmoothing(i,j,img)
[m,n]=size(img);

if(i>1 && i<m && j>1 && j<n)
    for chnnl = 1:3
   img1=img(:,:,1);
        avg=((img(i,j,chnnl)+img(i+1,j+1,chnnl)+img(i+1,j,chnnl)+img(i+1,j-1,chnnl)+img(i,j+1,chnnl)+img(i,j-1,chnnl)+img(i-1,j+1,chnnl)+img(i-1,j,chnnl)+img(i-1,j-1,chnnl))/9);
        img(i,j,chnnl)=avg;
    end
 end

% if(j>3)
%     img(i,j,1)= (img(i,j-1,1)+img(i,j-2,1)+img(i,j-3,1))/3;
%     img(i,j,2)= (img(i,j-1,2)+img(i,j-3,2)+img(i,j-3,2))/3;
%     img(i,j,3)= (img(i,j-1,3)+img(i,j-2,3)+img(i,j-3,3))/3;
% end
% 
% if(j<sz(2))
%     img(i,j,1)= (img(i,j,1)+img(i,j+1,1)+img(i,j+2,1)+img(i,j+3,1))/4;
%     img(i,j,2)= (img(i,j,2)+img(i,j+1,2)+img(i,j+3,2)+img(i,j+3,2))/4;
%     img(i,j,3)= (img(i,j,3)+img(i,j+1,3)+img(i,j+2,3)+img(i,j+3,3))/4;
% end
% 


out_img = img;
end

