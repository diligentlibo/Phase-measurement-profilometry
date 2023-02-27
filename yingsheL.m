clc;
clear all;
load('FIL.mat');
load('hx33L.mat');
load('hy33L.mat');
load('hx3.mat');
load('hy3.mat');
% hx3=hx3/2;
ii=~FIL;
% ii = FI == 0;
hx33L(ii)=[];
hy33L(ii)=[];

image = imread('fengjing.bmp');
img = imresize(image,[1024,1280]);
figure(1),imshow(img);

sum=0;
R = img(:,:,1);
imwrite(R,'Rfengjing.bmp');
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
imwrite(G,'Gfengjing.bmp');
Gfengjing = double(G);
Gfengjing(ii) = [];

B = img(:,:,3);
imwrite(B,'Bfengjing.bmp');
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
R1 = griddata(hx33L,hy33L,Rfengjing,hx3,hy3);
G1 = griddata(hx33L,hy33L,Gfengjing,hx3,hy3);
B1 = griddata(hx33L,hy33L,Bfengjing,hx3,hy3);

imwrite(mat2gray(R1),'R1fengjing.bmp');
imwrite(mat2gray(G1),'G1fengjing.bmp');
imwrite(mat2gray(B1),'B1fengjing.bmp');

R2=imread('R1fengjing.bmp');
G2=imread('G1fengjing.bmp');
B2=imread('B1fengjing.bmp');

RGB(:,:,1)=R2(:,:,1);
RGB(:,:,2)=G2(:,:,1);
RGB(:,:,3)=B2(:,:,1);

imwrite(RGB,'RGB1.bmp');
figure(2),imshow(RGB);
