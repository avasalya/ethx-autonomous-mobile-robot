% parameter
tol      =  0.01;
maxIter  = 50;

% initialize map
Map = zeros(11,9);
Map(1,:) = -1; Map(11,:) = -1; Map(:,1) = -1; Map(:,9)     = -1;
Map(9,2) = -1; Map(10,2) = -1; Map(10,3)= -1; Map(5:6,5:8) = -1;

% initialize search start and goal locations
SearchStart = [3,7];
SearchGoal  = [9,6];

% initialize iterative search
SearchSolution = zeros(size(Map));
SearchSolution(Map==-1)=1;   %set obstacle cells to "1"
SearchSolution(Map==0) =0.5; %set free cells to "0.5" % obstacle: high potential
SearchSolution(SearchGoal(1),SearchGoal(2)) = 0; % goal: low potential

% visualize the solution
figure(1) %before Harmonic Potential Fields
subplot(1,2,1)
surf(SearchSolution)
% hold on

subplot(1,2,2)
imagesc(SearchSolution)
set(gca, 'dataAspectRatio', [1 1 1])

% iteratively solve the discrete Laplace Equation with Dirichlet boundary conditions

iter = 0;
old_solution = inf(size(Map));


% check for two conditions
% 1. loop until iter is equal to maxIter
% 2. continue until largest update becomes smaller than tol
while iter < maxIter && max(abs(old_solution(:) - SearchSolution(:))) > tol

    % update iterate
    iter = iter + 1;
    
    old_solution = SearchSolution;
    
    
    for x = 1:size(SearchSolution, 1)
        for y = 1:size(SearchSolution,2)
            
            % don't update obstacles or goals
%             if old_solution(x,y) == 1 || old_solution(x,y) == 0
%                 SearchSolution(x,y) = old_solution(x,y);
%                 continue;
%             end

            if and(old_solution(x,y) ~= 0, old_solution(x,y)~=1)
            
                % update rest of the grid map
                U_q = 1/4 *(old_solution(x-1,y) + old_solution(x+1, y)...
                     + old_solution(x, y-1) + old_solution(x, y+1));

                SearchSolution(x,y) = U_q;
            end
            
        end
    end
    
end


% visualize the solution
figure(2) %after Harmonic Potential Fields
subplot(1,2,1)
surf(SearchSolution)
% hold on

subplot(1,2,2)
imagesc(SearchSolution)
set(gca, 'dataAspectRatio', [1 1 1])

























