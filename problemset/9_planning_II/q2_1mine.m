%binary Min-Heap

% the following elements are to be inserted into the heap
ElementsToInsert = [];
ElementsToInsert(1).pos = [3,1]; ElementsToInsert(1).key = 4;       
ElementsToInsert(2).pos = [3,2]; ElementsToInsert(2).key = 2;   
ElementsToInsert(3).pos = [3,3]; ElementsToInsert(3).key = 1; 
ElementsToInsert(4).pos = [4,2]; ElementsToInsert(4).key = 3;

% binary min-heap container
% use the same structure as for "ElementsToInsert"
BinMinHeap = [];

for n=1:1:length(ElementsToInsert)
    %insert ElementsToInsert(n) at the end of the heap
    
    node = ElementsToInsert(n);
    idx = length(BinMinHeap) + 1; % inc its length with each new node
    
    BinMinHeap(idx).pos = node.pos;
    BinMinHeap(idx).key = node.key;
   
    %make heap consistent by moving the inserted element
    %up the binary tree
    while idx > 1 && BinMinHeap(idx).key < BinMinHeap(floor(idx/2)).key
        
        %swap parent to child
        BinMinHeap(idx) = BinMinHeap(floor(idx/2));
        
        % swap child to parent
        BinMinHeap(floor(idx/2)) = node;
        
        % update idx
        idx = floor(idx/2);
                
    end
end