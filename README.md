KMeansClusterer
===

[k-means](http://en.wikipedia.org/wiki/K-means_clustering) and [k-medians](http://en.wikipedia.org/wiki/K-medians_clustering) clustering in Ruby. Uses [NArray](https://github.com/masa16/narray) under the hood for fast calculations.

Features:
- Runs multiple clustering attempts to find optimal solution (single runs are susceptible to falling into non-optimal local minima)
- Initializes centroids via [k-means++](http://en.wikipedia.org/wiki/K-means%2B%2B) algorithm
- Calculates [silhouette](http://en.wikipedia.org/wiki/Silhouette_%28clustering%29) score for evaluation


Usage
---
Simple example:

```ruby
data = [[40.71,-74.01],[34.05,-118.24],[39.29,-76.61],
        [45.52,-122.68],[38.9,-77.04],[36.11,-115.17]]

labels = ['New York', 'Los Angeles', 'Baltimore', 
          'Portland', 'Washington DC', 'Las Vegas']

k = 2 # find 2 clusters in data

# Options:
#   labels: array of Ruby objects to collate with data array
#   runs: number of times to run kmeans (default is 10)
#   init: algorithm for picking initial cluster centers, 
#         :kmpp (k-means++, default) or :random
kmeans = KMeansClusterer.run k, data, labels: labels, runs: 10

kmeans.clusters.each do |cluster|
  puts  cluster.label.to_s + '. ' + 
        cluster.points.map(&:label).join(", ") + "\t" +
        cluster.center.to_s
end

# Use existing clusters for prediction with new data:
cluster = kmeans.closest_cluster [41.85,-87.65] # Chicago
puts "\nClosest cluster to Chicago: #{cluster.label}"

# Clustering quality score. Value between -1.0..1.0 (1.0 is best)
puts "\nSilhouette score: #{kmeans.silhouette_score.round(2)}"

# Outputs:
#
# 1. New York, Baltimore, Washington DC [39.63, -75.89]
# 2. Los Angeles, Portland, Las Vegas [38.56, -118.7]
#
# Closest cluster to Chicago: 1
#
# Silhouette score: 0.91
```

k-medians clustering is available via ```KMediansClusterer``, which has the same api
as ```KMeansClusterer```:

```ruby
# same api as KMeansClusterer
kmedians = KMediansClusterer.run k, data, labels: labels, runs: 10
```

k-medians uses the Manhattan distance measure instead of Euclidean distance
and calculates centroids via the median of points instead of the mean.


License
---
MIT
