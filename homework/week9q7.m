% This is a sample code to solve quizz 7 of week 9.
% Here is a link to that quizz: https://class.coursera.org/digital-002/quiz/feedback?submission_id=32949

MAXI = double(255);

% read input image and show it
I1 = (imread('Cameraman256.bmp'));

figure, imshow(I1);

O1 = zeros(256,256);

% convert bmp to jpg
Q = 10; % control quality level
%Q = 75;
outName = 'camcam.jpg';
imwrite(I1, outName, 'jpg', 'quality', Q);

I2 = (imread('camcam.jpg'));

figure, imshow(I2);

% calc diff
% begin of calc MSE (x,y)=(i,j)
diff = abs(double(I2) - double(I1));
diff2 = double(diff/MAXI);

figure, imshow(abs(diff2));

vmse = double(0);
SIZE=256;
for j = 1: SIZE
    for i = 1: SIZE
        vmse = vmse + double(diff(i,j))*double(diff(i,j));
    end
end

%mse = mse / (SIZE*SIZE); 
vmse = vmse / (double(SIZE)*double(SIZE));

psnr = 10*log10 (MAXI*MAXI/vmse);
