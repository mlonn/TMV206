function [] = f(A,b,X, n)
    X=[X, X(:,1)]; %copy the first point to the end to close the chain
    Axb = A*X +b;
    
    %calculate max and min values to find ideal plot size
    maxX = max(max(X(1,:), max(Axb(1,:))));
    maxY = max(max(X(2,:), max(Axb(2,:))));
    minX = min(min(X(1,:), min(Axb(1,:))));
    minY = min(min(X(2,:), min(Axb(2,:))));
    MIN = min(minX, minY);
    MAX = max(maxX, maxY);
    padding = (MAX - MIN)/10;
    
    %plot X in subplot 1
    subplot(1,2,1)
    fill(X(1,:), X(2,:),'g')
    axis([MIN-padding,MAX+padding, MIN-padding, MAX+padding])
    title('X')
    pbaspect([1 1 1])
    %plot AX+b in subplot 2
    subplot(1,2,2);
    fill(Axb(1,:), Axb(2,:),'b')
    axis([MIN-padding,MAX+padding, MIN-padding, MAX+padding])
    title('AX + b')
    pbaspect([1 1 1])
end
