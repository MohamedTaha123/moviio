class MovieSerializer < ActiveModel::Serializer
  cache key: 'movie'
  attributes :id, :title, :plot
end
