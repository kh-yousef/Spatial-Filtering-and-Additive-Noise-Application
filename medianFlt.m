function outputImage = medianFlt(inputImage, kernelSize)

   
            padding = floor(kernelSize / 2);
            paddedImage = padarray(inputImage, [padding, padding], 'replicate', 'both');
            outputImage = zeros(size(inputImage));
        
            % Apply median filtering
            for i = 1:size(inputImage, 1)
                for j = 1:size(inputImage, 2)
                    % Extract the region of interest (ROI) from the padded image
                    roi = paddedImage(i:i+2*padding, j:j+2*padding);
        
                    % Compute the median and assign it to the output image
                    outputImage(i, j) = median(roi(:));
                end
            end
        
            % Convert to uint8 if the input image is in uint8 format
            if isequal(class(inputImage), 'uint8')
                outputImage = uint8(outputImage);
            end
        end