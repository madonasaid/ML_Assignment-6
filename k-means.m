function [ cluster, centr ] = kMeans( k, P )

numP = size(P,2);
dimP = size(P,1);

randIdx = randperm(numP,k);

centr = P(:,randIdx);

cluster = zeros(1,numP);
clusterPrev = cluster;
iterations = 0;
stop = false;

while stop == false
    
    % for each data point 
    for idxP = 1:numP
        % init distance array dist
        dist = zeros(1,k);
        % compute distance to each centroid
        for idxC=1:k
            dist(idxC) = norm(P(:,idxP)-centr(:,idxC));
        end
        % find index of closest centroid (= find the cluster)
        [~, clusterP] = min(dist);
        cluster(idxP) = clusterP;
    end
    
    % Recompute centroids using current cluster memberships:
        
    % init centroid array centr
    centr = zeros(dimP,k);
    % for every cluster compute new centroid
    for idxC = 1:k
        % find the points in cluster number idxC and compute row-wise mean
        centr(:,idxC) = mean(P(:,cluster==idxC),2);
    end
    
    
    if clusterPrev==cluster
        stop = true;
    end

    clusterPrev = cluster;
    
    iterations = iterations + 1;
    
end



fprintf('kMeans.m used %d iterations of changing centroids.\n',iterations);
end
