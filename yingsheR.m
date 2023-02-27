clc;
clear all;
load('FIR.mat');
load('hx33R.mat');
load('hy33R.mat');
load('hx3.mat');
load('hy3.mat');
% hx3=hx3/2;
ii=~FIR;
% ii = FI == 0;
hx33R(ii)=[];
hy33R(ii)=[];

image = imread('fengjing.bmp');
img = imresize(image,[1024,1280]);
figure(1),imshow(img);

sum=0;
R = img(:,:,1);
imwrite(R,'R2fengjing.bmp');
% for i=1:1024
%     strip_R=R(i,:);
%     strip_R(ii(i,:))=[];
%     if sum(ii(i,:)<1280
%         sum=sum+1;
%         Rfengjing=(sum,:)=strip_R;
%     end
%     
% end


 Rfengjing = double(R);
 Rfengjing(ii) = [];
% FI = R(:);
% aa = FI == 0;
% FI(aa) = [];

G = img(:,:,2);
imwrite(G,'G2fengjing.bmp');
Gfengjing = double(G);
Gfengjing(ii) = [];

B = img(:,:,3);
imwrite(B,'B2fengjing.bmp');
Bfengjing = double(B);
Bfengjing(ii) = [];

% sum1=0;
% [p,q]=size(Rfengjing);
% for i=1:q
%     [m,n]=size(Rfengjing(i,:));
%     for j=1:n;
%         R1(i,n) = griddata(hx33,hy33,Rfengjing(i,n),hx3,hy3);
%         sum1=sum1+1;
%         R1gather(sum,n)=R1(1,n);
%         
R2 = griddata(hx33R,hy33R,Rfengjing,hx3,hy3);
G2 = griddata(hx33R,hy33R,Gfengjing,hx3,hy3);
B2 = griddata(hx33R,hy33R,Bfengjing,hx3,hy3);

imwrite(mat2gray(R2),'R3fengjing.bmp');
imwrite(mat2gray(G2),'G3fengjing.bmp');
imwrite(mat2gray(B2),'B3fengjing.bmp');

R2=imread('R3fengjing.bmp');
G2=imread('G3fengjing.bmp');
B2=imread('B3fengjing.bmp');

RGB(:,:,1)=R2(:,:,1);
RGB(:,:,2)=G2(:,:,1);
RGB(:,:,3)=B2(:,:,1);

imwrite(RGB,'RGB3.bmp');
figure(2),imshow(RGB);
