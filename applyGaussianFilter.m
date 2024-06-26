function outputImage = applyGaussianFilter(inputImage, std)
    kernel = customGaussianKernel(std);
    outputImage = imfilter(inputImage, kernel, 'conv');
end

function kernel = customGaussianKernel(std)
    kernel_size = std * 6;
    kernel_size = kernel_size + (1 - mod(kernel_size, 2)); % Ensure the kernel size is odd
    halfSize = (kernel_size - 1) / 2;
    [x, y] = meshgrid(-halfSize:halfSize, -halfSize:halfSize);
    exponent = -(x.^2 + y.^2) / (2 * std^2);
    kernel = exp(exponent) / (2 * pi * std^2);
    kernel = kernel / sum(kernel(:)); % Normalize
end

