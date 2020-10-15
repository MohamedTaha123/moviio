# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :integer          not null
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#
# Foreign Keys
#
#  season_id  (season_id => seasons.id)
#
class EpisodeSerializer < ActiveModel::Serializer
  cache key: 'episode'
  attributes :id, :title, :plot
end
