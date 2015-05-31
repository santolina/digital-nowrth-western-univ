% This is a sample code to solve quiz 7 of week8 homework. 
% Here is a link to quizz: https://class.coursera.org/digital-002/quiz/feedback?submission_id=31776
% Here is a link to iamge "Cameraman256.bmp": https://d396qusza40orc.cloudfront.net/digital/images/week8_quizzes/Cameraman256.bmp

MAXI = double(255);

% read input image and show it
I1 = (imread('Cameraman256.bmp'));

figure, imshow(I1);

% calc histogram
Hist = zeros(256);

%vmse = double(0);
SIZE=256;
for j = 1: SIZE
    for i = 1: SIZE
        idx = I1(i,j);
        Hist(idx+1) = Hist(idx+1) + 1;
    end
end

% normalize histogram, i.e prob
P = zeros(256);
for j = 1: SIZE
    P(j) = double(Hist(j) / (MAXI*MAXI));
end

figure, plot(P);

% calc entropy
I = zeros(256);
for i = 1 : SIZE
    if P(i) == 0
        I(i) = 0;
    end
    I(i) = - double(P(i)) * double(log2(P(i)));
end
figure, plot(I);

H = double(0);

% the value of I(SIZE) is NaN, so tentatively endNum = SIZE-1 is used. should be fixed.
for i = 1 : SIZE-1
    H = H + double(I(i));
end
