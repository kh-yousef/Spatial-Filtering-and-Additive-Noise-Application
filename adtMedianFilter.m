function outputImage = adtMedianFilter(image, maxWindowSize,rows,cols)
            inputImage=image;
            outputImage = zeros(rows, cols);
            for i = 1:rows
                for j = 1:cols
                    windowSize = 3;  % Initial window size
                    zMin = inputImage(i, j);
                    zMax = inputImage(i, j);
                    
                    % Incrementally increase the window size until it reaches the maximum
                    while windowSize <= maxWindowSize
                        % Extract the local window
                        window = inputImage(max(1, i - windowSize):min(rows, i + windowSize), ...
                                             max(1, j - windowSize):min(cols, j + windowSize));
                        
                        zMin = min(window(:));
                        zMax = max(window(:));
                        zMed = median(window(:));
                        if zMin < zMed && zMed < zMax
                            break;
                        else
                            % Increase the window size and continue the loop
                            windowSize = windowSize + 2;
                        end
                    end
                    
                    outputImage(i, j) = zMed;
                end
            end
end
                  