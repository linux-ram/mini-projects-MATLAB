function displayRGB(filename)
% display a color image, as well as its red, green, and blue layers separately
clc
close all

im=imread(filename);

red_layer=im;
red_layer(:,:,[2,3])=0;
blue_layer=im;
blue_layer(:,:,[1,2])=0;
green_layer=im;
green_layer(:,:,[1,3])=0;
image(red_layer);
figure;
image(blue_layer);
figure;
image(green_layer);
figure;
image(red_layer+blue_layer+green_layer);