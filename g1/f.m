function [] = f2(A,b,X)
    clf;
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
    line([MIN-padding MAX+padding], [0 0],'color','k') %x-axis
    line( [0 0],[MIN-padding MAX+padding],'color','k') %x-axis
    axis([MIN-padding,MAX+padding, MIN-padding, MAX+padding])
    title('X')
    
    %plot AX+b in subplot 2
    subplot(1,2,2);
    fill(Axb(1,:), Axb(2,:),'b')
    line([MIN-padding MAX+padding], [0 0],'color','k') %x-axis
    line( [0 0],[MIN-padding MAX+padding],'color','k') %x-axis
    axis([MIN-padding,MAX+padding, MIN-padding, MAX+padding])
    title('AX + b')
end
