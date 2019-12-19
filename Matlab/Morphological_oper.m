%%%%% Morphological operations %%%%%
i1 = imread('bubble.jpg');
i2=im2bw(i1,0.8)
figure,imshow(i2),title('Original binary image');;
SE = ones(5,5);
BW2 = imerode(i2,SE);
figure,imshow(BW2),title('Eroded image');;
BW3 = imdilate(i2,SE);
figure,imshow(BW3),title('Dilated image');;
BW4 = bwmorph(i2,'skel',Inf);
figure, imshow(BW4),title('skeleton of image');
BW5=imopen(i2,SE);
BW6=imclose(i2,SE);
figure, imshow(BW5),title('Opening');
figure, imshow(BW6),title('Closing');
BW7=i2-BW2;
figure, imshow(BW5),title('Thinning');
BW8 = bwhitmiss(i2,SE);
figure, imshow(BW5),title('Hit and miss');