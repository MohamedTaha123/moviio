# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MovieSerializer < ActiveModel::Serializer
  cache key: 'movie'
  attributes :id, :title, :plot
end
