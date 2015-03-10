Gem::Specification.new do |s|
  s.name        = 'kmeans-clusterer'
  s.version     = '0.10.0'
  s.date        = '2015-03-10'
  s.summary     = "k-means clustering"
  s.description = "k-means clustering. Uses NArray for fast calculations."
  s.authors     = ["Geoff Buesing"]
  s.email       = 'gbuesing@gmail.com'
  s.files       = ["lib/kmeans-clusterer.rb"]
  s.homepage    = 'https://github.com/gbuesing/kmeans-clusterer'
  s.license     = 'MIT'
  s.add_runtime_dependency 'narray', '~> 0.6'
end
