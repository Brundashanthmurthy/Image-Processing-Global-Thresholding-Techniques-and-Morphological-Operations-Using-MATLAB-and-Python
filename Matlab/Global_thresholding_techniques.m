%%Basic global thresholding algorithm%%

img = imread('r.jpeg');
subplot(3,2,1),imshow(img),title('8-bit 1024*1024');
threshold = input('Enter the initial threshold: ');
img_temp = img;
for i=1:1024
  for j=1:1024
    if img_temp(i,j) > threshold
      img_temp(i,j)=255;
    else 
      img_temp(i,j)=0;
    end
  end
end
subplot(3,2,3),imshow(img_temp),title(['Threshold: ',num2str(threshold)]);
no_of_iterations = 0;
img = double(img); new_threshold = 0; diff = 1;
disp('Iter m1-m2 Threshold');
while(diff ~= 0);
m1 = 0;
m2 = 0;
c1 = 0;
c2 = 0;
for i=1:1024
  for j=1:1024
    if img(i,j) > threshold
      m1=m1+img(i,j);
      c1=c1+1;
    else
      m2=m2+img(i,j);
      c2=c2+1;
    end
  end
end
m1=m1/c1;
m2=m2/c2;
new_threshold=(m1+m2)/2;
diff = new_threshold - threshold;
threshold = new_threshold;
no_of_iterations = no_of_iterations + 1;
disp([num2str(no_of_iterations),')',num2str(m1),' - ',num2str(m2),' --> ' ,num2str(threshold)]);
for i=1:1024
  for j=1:1024
    if img(i,j) > threshold
      img(i,j)=255;
    else
      img(i,j)=0;
    end
  end
end
subplot(3,2,5),imshow(img),title(['Threshold: ',num2str(threshold)]);
disp(['Number of iterations: ',num2str(no_of_iterations)]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Basic edge detection - Gradient operators%%

%prewitt mask%
hmask = [-1 -1 -1;0 0 0;1 1 1];
vmask = [-1 0 1; -1 0 1; -1 0 1];
ldmask = [0 1 1; -1 0 1; -1 -1 0];
rdmask = [-1 -1 0; -1 0 1; 0 1 1];
img = imread('aaa.jpg');
hedge_img = imfilter(img,hmask,'conv');
vedge_img = imfilter(img,vmask,'conv');
ldiag_img = imfilter(img,ldmask,'conv');
rdiag_img = imfilter(img,rdmask,'conv');
figure(1),imshow(img),title('Original Image');
figure(2),imshow(hedge_img),title('Horizontal edge mask detection');
figure(3),imshow(vedge_img),title('Vertical edge mask detection');
figure(4),imshow(ldiag_img),title('left diagonal mask detection');
figure(5),imshow(rdiag_img),title('right diagonal mask detection');

%Sobel mask%
hmask = [-1 -2 -1;0 0 0;1 2 1];
vmask = [-1 0 1; -2 0 2; -1 0 1];
ldmask = [0 1 2; -1 0 1; -2 -1 0];
rdmask = [-2 -1 0; -1 0 1; 0 1 2];
img = imread('aaa.jpg');
hedge_img = imfilter(img,hmask,'conv');
vedge_img = imfilter(img,vmask,'conv');
ldiag_img = imfilter(img,ldmask,'conv');
rdiag_img = imfilter(img,rdmask,'conv');
figure(1),imshow(img),title('Original Image');
figure(2),imshow(hedge_img),title('Horizontal edge mask detection');
figure(3),imshow(vedge_img),title('Vertical edge mask detection');
figure(4),imshow(ldiag_img),title('left diagonal mask detection');