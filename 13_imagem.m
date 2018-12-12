im = imread('sol.jpg');
imshow(im);
irgb= rgb2gray(im);
imshow(irgb);

up = [0 0 0; 0 0 0; 0 1 0];
right = [0 0 0; 1 0 0; 0 0 0];
left = [0 0 0; 0 0 1; 0 0 0];
down = [0 1 0; 0 0 0; 0 1 0];
blur1 = [0 0 0; 0 0 1; 0 1 0];
blur2 = [0 1 0; 1 0 1; 0 1 0];
blur3 = [1 4 7 4 1; 4 16  26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];

B=conv2(double(blur1),double(irgb));
figure; imshow(uint8(B));

B2=conv2(double(blur1/2),double(irgb));
figure; imshow(uint8(B2));

B3=conv2(double(blur2/4),double(irgb));
figure; imshow(uint8(B3));

B4=conv2(double(blur3/273),double(irgb));
figure; imshow(uint8(B4));
