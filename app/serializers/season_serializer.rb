# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SeasonSerializer < ActiveModel::Serializer
  cache key: 'season'
  attributes :id, :title, :plot
  has_many :episodes
end
