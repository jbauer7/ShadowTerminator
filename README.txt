Shadow Terminator:
Shadow terminator detects shadows in images then attemps to remove the 
shadow from the image. 
For more information go to this URL: https://sites.google.com/a/wisc.edu/shadow-terminator/
Authors: Jospeh Bauer, Elliot Busta, Eric Johnson
Other Contributions: RGB2Lab.m and Lab2RGB.m are functions provide by Professor for Homework #2

Running Shadow Terminator:
(1) Run Shadow_Terminator.m script
(2) Example images are located in the Input_Images/ directory
    labled: input1, input2,..., input6
(3) Output images in the Output_Images/ directory

The general method for the shadow detction and removal is as follows:
(1) Convert image to LAB color space
(2) Detect shadow using mean and standard deviation thresholds
(3) Find average luminosity of shadowed and non-shadowed region
(4) Replace pixel luminosity (L channel) of shadowed region with the mean
    from the non-shadow region using mean shift algorithm
(5) Use mean shift on shadow region on the A and B channels to adjust
    chromaticity 
(6) Smooth edges to increase continuity of image
(7) Convert back to RGB color space

