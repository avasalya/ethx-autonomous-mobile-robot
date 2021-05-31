% binary min-heap container
% let us assume the heap contains the following elements already and 
% is in a consistent state
BinMinHeap = [];
BinMinHeap(1).pos = [3,3]; BinMinHeap(1).key = 1;
BinMinHeap(2).pos = [4,2]; BinMinHeap(2).key = 3;
BinMinHeap(3).pos = [3,2]; BinMinHeap(3).key = 2;
BinMinHeap(4).pos = [3,1]; BinMinHeap(4).key = 4;
BinMinHeap(5).pos = [4,3]; BinMinHeap(5).key = 5;

% extract the minimal element from the heap and store it in "ExtractedElement"
ExtractedElement = BinMinHeap(1);


% move the bottom element to top
BinMinHeap(1) = BinMinHeap(end);
heapSize = length(BinMinHeap);


%make heap consistent again by first moving the bottom element
%to the top and then down the binary tree
consistent = false;

i = 1;
while ~consistent
    
    % more than one children and parent is larger
    if heapSize >= (i*2 + 1) && min(BinMinHeap(i*2).key, BinMinHeap(i*2 + 1).key) < BinMinHeap(i).key
        
        % swap child
        temp = BinMinHeap(i);
        
        % if right child is min
        if BinMinHeap(i*2 + 1).key < BinMinHeap(i*2).key
            
            BinMinHeap(i) = BinMinHeap(i*2 + 1);
            BinMinHeap(i*2 + 1) = temp;
            
             i = i*2 + 1;
            
        % if left child is min
        else
            BinMinHeap(i) = BinMinHeap(i*2);
            BinMinHeap(i*2) = temp;
           
            i = i*2;
        end
        
    % only one child and parent is larger
    elseif heapSize == i*2 && BinMinHeap(i).key > BinMinHeap(i*2).key
        
        % swap child and parent
        temp = BinMinHeap(i);
        BinMinHeap(i) = BinMinHeap(i*2);
        BinMinHeap(i*2) = temp;
        
        % increment i;
        i = i*2;
        
    else
        consistent = true;
      
    end
end


% delete last element
BinMinHeap(5)  = []
