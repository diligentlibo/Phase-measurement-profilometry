clc;
% clear;
w=1280;
h=1024;
I = zeros(h, w, 24);
I1 = zeros(h, w);
I2 = zeros(h, w);
I3 = zeros(h, w);
I4 = zeros(h, w);
p = zeros(h, w, 3);
for n = 1:24
I(:,:,n)=rgb2gray(imread(([num2str(n,'%d'),'.bmp'])));
end
%  se = strel('square',20);
%  for n = 1:24
%      I(n) = imerode(I(n),se);
%  end
m=zeros(1024,1280);
 for i=1:1024
     for j=1:1280
         m(i,j)=sqrt((I(i,j,21)*sin(0)+I(i,j,22)*sin(2*1*pi/4)+I(i,j,23)*sin(2*2*pi/4)+I(i,j,24)*sin(2*3*pi/4))^2)+((I(i,j,21)*cos(0)+I(i,j,22)*cos(2*1*pi/4)+I(i,j,23)*cos(2*2*pi/4)+I(i,j,24)*cos(2*3*pi/4))^2);
     end
 end
 
 se1=strel('square',20);
 m=imerode(m,se1);
 figure,imshow((m));
 FIR=m>8;
 m=FIR.*m;

%% 对图形用调制度模板处理
%  for i=1:1024
%      for j=1:1280
%          if(m(i,j)>0)
%              m(i,j)=1;
%          end
%          if(m(i,j)==1)
%              I(i,j,:)=I(i,j,:);
%          else
%              I(i,j,:)=0;
%          end
%      end
%  end
 I = repmat(m,1,1,24).*I;

for n= 1:3
  I1 =  I(:,:, (n-1)*4+1);
  I2 =  I(:,:, (n-1)*4+2);
  I3 =  I(:,:, (n-1)*4+3);
  I4 =  I(:,:, (n-1)*4+4);
    p(:, :, n) = atan2((I4-I2), (I1- I3));
end
px1 = p(:, :, 1);
px2 = p(:, :, 2);
px3 = p(:, :, 3);
 hx2 = floor((px1*8 - px2)/(2*pi))*2*pi + px2;
 hx33R = floor((hx2*8 - px3)/(2*pi))*2*pi + px3;
figure, imshow(mat2gray(hx33R));

for n= 1:3
  I1 =  I(:,:, (n-1)*4+13);
  I2 =  I(:,:, (n-1)*4+14);
  I3 =  I(:,:, (n-1)*4+15);
  I4 =  I(:,:, (n-1)*4+16);  
   p(:, :, n) = atan2((I4-I2), (I1- I3));
     %for i = 1:1024
         %for j = 1:1280
            %p(i,j,n) = atan2((I4(i,j) - I2(i,j)), (I1(i,j)-I3(i,j)));
         %end
     %end
end
py1 = p(:, :, 1);
py2 = p(:, :, 2);
py3 = p(:, :, 3);
hy2 = floor((py1*8 - py2)/(2*pi))*2*pi + py2;
hy33R = floor((hy2*8 - py3)/(2*pi))*2*pi + py3;
figure, imshow(mat2gray(hy33R));
 