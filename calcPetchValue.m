%this function calculates the value of a petch located in rowNum,colNum
%with width and hieght. 

function petchValue = calcPetchValue(rowNum, colNum, mat, width, height)

    [imgHeight,imgWidth] = size(mat);
    petchValue = 0.0;
    for i = 1:1:imgHeight
        for j = 1:1:imgWidth
            %if the pixel is in the petch:
            if(ceil((rowNum-1)*height)<=i && i<=floor(rowNum*height) && (ceil((colNum-1)*width)<=j)&& j<=floor(colNum*width))
                petchValue = petchValue + mat(i,j);
            end
            %if the pixel is in the only above the petch 
            if (floor((rowNum-1)*height)>i && ceil((rowNum-1)*height)<i && (ceil((colNum-1)*width)<=j)&& j<=floor(colNum*width))
                petchValue = petchValue + (i-(rowNum-1)*height)*mat(i,j);
            end
            %if the pixel is in the only under the petch 
            if (floor((rowNum)*height)>i && ceil((rowNum)*height)<i && (ceil((colNum-1)*width)<=j)&& j<=floor(colNum*width))
                petchValue = petchValue + (1-(i-rowNum*height))*mat(i,j);
            end
            %if the pixel is only left to the petch 
            if (floor((colNum-1)*width)>j && ceil((colNum-1)*width)<j && (ceil((rowNum-1)*height)<=i)&& i<=floor(rowNum*height))
                petchValue = petchValue + (j-(colNum-1)*width)*mat(i,j);
            end
            %if the pixel is only right to the petch 
            if (floor((colNum)*width)>j && ceil((colNum)*width)<j && (ceil((rowNum-1)*height)<=i)&& i<=floor(rowNum*height))
                petchValue = petchValue + (1-(j-(colNum)*width))*mat(i,j);
            end
            %if the pixel is in the up left corner
            if floor((rowNum-1)*height)>i && ceil((rowNum-1)*height)<i && floor((colNum-1)*width)>j && ceil((colNum-1)*width)<j
                petchValue = petchValue + (j-(colNum-1)*width)*mat(i,j)+(i-(rowNum-1)*height)*mat(i,j);
            end
            %if the pixel is in up right corner
            if floor((rowNum-1)*height)>i && ceil((rowNum-1)*height)<i && (floor((colNum)*width)>j && ceil((colNum)*width)<j)
                petchValue = petchValue + (1-(j-(colNum)*width))*mat(i,j)+(i-(rowNum-1)*height)*mat(i,j);
            end
            %if the pixel is in down left corner
            if floor((rowNum)*height)>i && ceil((rowNum)*height)<i && floor((colNum-1)*width)>j && ceil((colNum-1)*width)<j
                petchValue = petchValue + (j-(colNum-1)*width)*mat(i,j)+(1-(i-rowNum*height))*mat(i,j);
            end
            %if the pixel is in down right corner
            if  floor((rowNum)*height)>i && ceil((rowNum)*height)<i && floor((colNum)*width)>j && ceil((colNum)*width)<j
                petchValue = petchValue + (1-(j-(colNum)*width))*mat(i,j)+(1-(i-rowNum*height))*mat(i,j);
            end
        end
    end
    petchValue = petchValue/width*height;
end