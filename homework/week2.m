% This is a sample code for quizz 7 of week2 homework.
% Here is a link to quizz of week2: https://class.coursera.org/digital-002/quiz/attempt?quiz_id=31
% 
MAXI = double(255);

% read input image and show it
I1 = double(imread('digital-images-week2_quizzes-lena.gif'));

figure, imshow(I1);

% gen 1st lowpass filter
h1 = ones(3,3) / 9;
%h1 = ones(5,5) / 25;

h1;

% filtering I1 with h
I2 = imfilter(double(I1), h1, 'replicate'); 

figure, imshow(I2);

% calc MSE

diff = abs(double(I2) - double(I1));
diff2 = double(diff/MAXI);

figure, imshow(diff2);

% begin of calc MSE (x,y)=(i,j)

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
