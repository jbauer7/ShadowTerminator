function E = imenergy(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%takes in a BW image, creates an energy function based
%on that image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Gmag, Gdir] = imgradient(I);
E = Gmag;

%Energy function variables 
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