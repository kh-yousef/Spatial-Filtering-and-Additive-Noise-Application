function outputImage = meanFlt(inputImage,kernelSize)
if size(inputImage, 3) == 3
    inputImage = rgb2gray(inputImage);
end
padding = floor(kernelSize / 2);
paddedImage = padarray(inputImage, [padding, padding], 'replicate', 'both');
outputImage = zeros(size(inputImage));
for i = 1:size(inputImage, 1)
    for j = 1:size(inputImage, 2)
        roi = paddedImage(i:i+2*padding, j:j+2*padding);
        outputImage(i, j) = mean(roi(:));
    end
end

if isequal(class(inputImage), 'uint8')
    outputImage = uint8(outputImage);
end 
end