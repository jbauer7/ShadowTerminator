function E = imenergy(I)
%I_grey = rgb2gray(I);
[Gmag, Gdir] = imgradient(I);
E = Gmag;
mean_e = mean2(E);
std_e = std2(E);
[m,n] =size(E);
%detecting edge based on energy
for i=1:m
    for j=1:n
        if(E(i,j) >= mean_e + (std_e)) %the multiplcation value controls noise
            E(i,j) = 1;
        end
    end
end


%imge = imagesc(E);
%figure,imshow(E); title('Energy');
